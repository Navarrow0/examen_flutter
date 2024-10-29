

import 'package:examen_flutter/config/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridImage extends StatelessWidget {
  const GridImage({super.key, required this.mainPlayDuration});

  final mainPlayDuration;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            _ImateTile(
              imgAsset: AppAssets.img1,
              width: context.w(215),
              height: context.h(150),
            ).animate().slideY(
              begin: -0.5,
              end: 0,
              duration: mainPlayDuration + 40.ms,
              curve: Curves.easeInOutCubic,
            ).fadeIn(duration: mainPlayDuration,),
            SizedBox(
              width: context.w(8),
            ),
            Expanded(
              child: _ImateTile(
                imgAsset: AppAssets.img4,
                width: context.w(30),
                height: context.h(150),
              )
                  .animate()
                  .slideX(
                begin: 0.5,
                end: 0,
                duration: mainPlayDuration + 50.ms,
                curve: Curves.easeInOutCubic,
              ).fadeIn(duration: mainPlayDuration,),
            ),
          ],
        ),
        SizedBox(
          height: context.h(8),
        ),
        Row(
          children: [
            Expanded(
              child: _ImateTile(
                imgAsset: AppAssets.img2,
                width: context.w(30),
                height: context.h(150),
              )
                  .animate()
                  .slideX(
                begin: -0.5,
                end: 0,
                duration: mainPlayDuration + 60.ms,
                curve: Curves.easeInOutCubic,
              ).fadeIn(duration: mainPlayDuration,),
            ),

            SizedBox(
              width: context.w(8),
            ),

            _ImateTile(
              imgAsset: AppAssets.img3,
              width: context.w(215),
              height: context.h(150),
            ).animate().slideY(
              begin: 0.5,
              end: 0,
              duration: mainPlayDuration + 70.ms,
              curve: Curves.easeInOutCubic,
            ).fadeIn(duration: mainPlayDuration,),
          ],
        )
      ],
    );
  }
}

class _ImateTile extends StatelessWidget {
  const _ImateTile({required this.imgAsset, this.width, this.height});

  final String imgAsset;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
          context.r(12)
      ),
      child: Image.asset(
        imgAsset,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
