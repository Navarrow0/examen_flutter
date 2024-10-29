


import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:examen_flutter/config/app_colors.dart';
import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';
import 'package:examen_flutter/features/home/presentation/widgets/contact_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key, this.onTap, required this.user});

  final UserDataEntity user;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(context.r(15)),
          boxShadow: const [
            AppColors.boxShadowPerfect
          ]
      ),
      padding: EdgeInsets.all(context.i(10)),
      child: Row(
        children: [

          Container(
            width: context.w(53),
            height: context.h(53),
            margin: EdgeInsets.only(right: context.i(12)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.r(10)),
                color: AppColors.lightGrey1
            ),
            child: const Icon(
              FluentIcons.person_32_filled,
              color: AppColors.grey,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(user.name,
                    style: TextStyle(
                        fontSize: context.sp(14),
                    ),),
                  SizedBox(
                    width: context.w(8),
                  ),
                  Text('${user.edad.toString()} años',
                    style: TextStyle(
                        fontSize: context.sp(12),
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600
                    ),),
                ],
              ),
              SizedBox(
                height: context.h(8),
              ),
              ContactText(
                data: user.email,
                borderColor: AppColors.primaryColor,
                onTap: () async {
                  await EasyLauncher.email(
                      email: user.email,
                      subject: "Usuario",
                      body: "Hola te agregue como usuario");
                },
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              style: IconButton.styleFrom(backgroundColor: AppColors.lightTaskColor),
              onPressed: onTap,
              padding: EdgeInsets.zero,
              icon: Icon(
                FluentIcons.ios_arrow_rtl_24_filled,
                color: AppColors.black,
                size: context.sp(16),
              ))
        ],
      ),
    );
  }
}
