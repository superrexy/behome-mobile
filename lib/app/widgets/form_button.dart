import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.buttonBackgroundColor,
  }) : super(key: key);
  final Function()? onPressed;
  final String label;
  final Color? buttonBackgroundColor;

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onPressed: onPressed,
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: Colors.black,
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 50.0,
    //       vertical: 15.0,
    //     ),
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(10.0),
    //       ),
    //     ),
    //   ),
    //   child: Text(
    //     label,
    //     style: const TextStyle(color: Colors.white),
    //   ),
    // );

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: buttonBackgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
