import 'package:aura_box/aura_box.dart';
import 'package:examen_flutter/config/app_colors.dart' as config;
import 'package:examen_flutter/config/app_route_names.dart';
import 'package:examen_flutter/features/onboarding/presentation/widgets/grid_images.dart';
import 'package:examen_flutter/features/widgets/button_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final mainPlayDuration = 1000.ms;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuraBox(
          spots: [
            AuraSpot(
              color: config.AppColors.purple,
              radius: context.r(250),
              alignment: Alignment.bottomRight,
              blurRadius: 10.0,
              stops: const [0.0, 0.5],
            ),
            AuraSpot(
              color: config.AppColors.darkYellow,
              radius: context.r(400),
              alignment: Alignment.topLeft,
              blurRadius: 10.0,
              stops: const [0.0, 0.7],
            ),
          ],
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.rectangle,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.i(20), vertical: context.i(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GridImage(mainPlayDuration: mainPlayDuration,),
                  SizedBox(
                    height: context.h(35),
                  ),
                  Text(
                    'Bienvenido de nuevo!',
                    style: TextStyle(fontSize: context.sp(22),
                        fontWeight: FontWeight.bold),
                  ).animate().slideY(
                    begin: -0.5,
                    end: 0,
                    duration: mainPlayDuration + 180.ms,
                    curve: Curves.easeInOutCubic,
                  ).fadeIn(duration: mainPlayDuration,),
                  SizedBox(
                    height: context.h(3),
                  ),
                  Text(
                    'Pon a prueba tus habilidades creando, viendo, editando y eliminando usuarios.',
                    style: TextStyle(fontSize: context.sp(13),),
                    textAlign: TextAlign.center,
                  ).animate().slideY(
                    begin: -0.5,
                    end: 0,
                    duration: mainPlayDuration + 190.ms,
                    curve: Curves.easeInOutCubic,
                  ).fadeIn(duration: mainPlayDuration,),
                  SizedBox(height: context.h(25),),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonBuilder(
                      buttonType: ButtonType.flat,
                      label: 'Comenzar',
                      onPressed: (){
                        context.go(AppRouteNames.home.path);
                      },
                    ),
                  ).animate().slideY(
                    begin: -0.5,
                    end: 0,
                    duration: mainPlayDuration + 200.ms,
                    curve: Curves.easeInOutCubic,
                  ).fadeIn(duration: mainPlayDuration,),
                  SizedBox(height: context.h(25),)
                ],
              ),
            ),
          ),
        ));
  }
}

