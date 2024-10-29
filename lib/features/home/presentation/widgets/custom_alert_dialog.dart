import 'package:examen_flutter/app.dart';
import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';
import 'package:examen_flutter/features/home/domain/providers/user_providers.dart';
import 'package:examen_flutter/shared/widgets/cherry_toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dialog_button.dart';

Future<void> showCustomDialog(BuildContext context, WidgetRef ref,
    {int? userId}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => CustomAlertDialog(userId: userId),
  ).then((_) {
    ref.invalidate(getUsersProvider(null));
  });
}

class CustomAlertDialog extends ConsumerStatefulWidget {
  final int? userId;

  const CustomAlertDialog({super.key, this.userId});

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends ConsumerState<CustomAlertDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Información'),
      insetPadding: EdgeInsets.all(context.i(5)),
      content: widget.userId != null
          ? Consumer(
              builder: (context, ref, _) {
                final userAsyncValue =
                    ref.watch(userByIdProvider(widget.userId!));

                return userAsyncValue.when(
                  loading: () => const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                  error: (error, _) => Text('Error: $error'),
                  data: (user) {
                    nameController.text = user.data.name;
                    emailController.text = user.data.email;
                    ageController.text = user.data.edad.toString();

                    return _buildForm();
                  },
                );
              },
            )
          : _buildForm(),
      actions: <Widget>[
        Row(
          children: [
            if (widget.userId != null)
              DialogButton(
                text: 'Eliminar',
                onPressed: () async {
                  final confirm = await _showConfirmationDialog(context);
                  if (confirm) {
                    final result = await ref
                        .read(deleteUserUseCaseProvider)
                        .call(userId: widget.userId!);
                    result.fold(
                      (error) => showCherryToast(
                        context: context,
                        message: error,
                        type: ToastType.error,
                      ),
                      (_) {
                        showCherryToast(
                          context: context,
                          message: 'Usuario eliminado correctamente!',
                          type: ToastType.success,
                        );
                        ref.invalidate(getUsersProvider(null));
                        Navigator.of(context).pop();
                      },
                    );
                  }
                },
              ),
            DialogButton(
              text: widget.userId == null ? 'Crear' : 'Actualizar',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final userData = UserDataEntity(
                    id: widget.userId,
                    name: nameController.text,
                    email: emailController.text,
                    edad: int.tryParse(ageController.text) ?? 0,
                  );

                  if (widget.userId == null) {
                    final result = await ref
                        .read(createUserUseCaseProvider)
                        .call(data: userData);
                    result.fold(
                      (error) => showCherryToast(
                        context: context,
                        message: error,
                        type: ToastType.error,
                      ),
                      (_) => showCherryToast(
                        context: context,
                        message: 'Usuario creado correctamente!',
                        type: ToastType.success,
                      ),
                    );
                  } else {
                    final result =
                        await ref.read(updateUserUseCaseProvider).call(
                              data: userData,
                              userId: widget.userId!,
                            );
                    result.fold(
                      (error) => showCherryToast(
                        context: context,
                        message: error,
                        type: ToastType.error,
                      ),
                      (_) => showCherryToast(
                        context: context,
                        message: 'Usuario actualizado correctamente!',
                        type: ToastType.success,
                      ),
                    );
                  }

                  ref.invalidate(getUsersProvider(null));
                  Navigator.of(context).pop();
                }
              },
            ),
            DialogButton(
              text: 'Cancelar',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nombre'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es obligatorio';
              }
              return null;
            },
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Correo electrónico'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es obligatorio';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Ingrese un correo electrónico válido';
              }
              return null;
            },
          ),
          TextFormField(
            controller: ageController,
            decoration: const InputDecoration(labelText: 'Edad'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es obligatorio';
              } else if (int.tryParse(value) == null) {
                return 'Ingrese una edad válida';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: const Text(
                '¿Estás seguro de que deseas eliminar este usuario?'),
            actions: [
              DialogButton(
                text: 'Cancelar',
                onPressed: () => Navigator.of(context).pop(false),
              ),
              DialogButton(
                text: 'Eliminar',
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        ) ??
        false;
  }
}
