import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactText extends StatelessWidget {
  const ContactText({
    super.key,
    this.onTap,
    required this.borderColor,
    required this.data,
  });

  final void Function()? onTap;
  final Color borderColor;
  final String data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
          context.r(100)
      ),
      child: Ink(
        padding: EdgeInsets.symmetric(
          vertical: context.i(2),
          horizontal: context.i(12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            context.r(100)
          ),
          border: Border.all(
            color: borderColor,
          )
        ),
        child: Text(data,
        style: TextStyle(
          color: borderColor,
          fontSize: context.sp(12)
        ),)
      ),
    );
  }
}
