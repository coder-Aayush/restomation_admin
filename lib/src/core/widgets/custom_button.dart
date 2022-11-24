import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restomation_admin/src/core/themes/app_colors.dart';
import 'package:restomation_admin/src/core/themes/app_styles.dart';

class CustomButton extends StatelessWidget {
  /// [title] argument is required
  const CustomButton({
    super.key,
    this.title,
    this.onPressed,
    this.titleStyle,
    this.backgroundColor = AppColors.primaryColor,
    this.shape,
    this.width = 140,
    this.height = 52,
    this.loading = false,
    this.isDisabled = true,
    this.icon,
    this.elevation = 0,
    this.gap = 17,
    this.splashColor,
    this.suffix,
  });

  final String? title;
  final Widget? icon;

  final double gap;

  final double elevation;

  final VoidCallback? onPressed;

  /// [titleStyle] is used to style the button text
  final TextStyle? titleStyle;

  // ignore: comment_references
  /// [gradient] for enabled state of button
  final Color backgroundColor;

  /// [shape] is used to apply border radius on button,
  final ShapeBorder? shape;

  /// [width] button width, defaults is 140
  final double width;

  /// [height] button height, defaults is 44
  final double height;

  /// [loading] is used to display circular progress indicator on loading event,
  ///  default is false
  final bool loading;

  /// [isDisabled] is used to disable to button, default is true
  final bool isDisabled;

  final Widget? suffix;

  final Color? splashColor;

  ShapeBorder get _shape =>
      shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  BoxConstraints get _constraints =>
      BoxConstraints.tightFor(width: width, height: height);

  Color get _splashColor => splashColor != null
      ? splashColor!
      : ((backgroundColor == AppColors.whiteColor ||
              backgroundColor == Colors.transparent)
          ? AppColors.primaryColor
          : AppColors.whiteColor.withOpacity(0.4));

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      clipBehavior: Clip.antiAlias,
      color: isDisabled ? AppColors.lightgreyColor : backgroundColor,
      shape: _shape,
      elevation: elevation,
      shadowColor: AppColors.softBlackColor,
      child: InkWell(
        splashColor: _splashColor,
        onTap: isDisabled || loading ? null : onPressed,
        child: ConstrainedBox(
          constraints: _constraints,
          child: Ink(
            decoration: ShapeDecoration(
              shape: _shape,
              color: isDisabled ? AppColors.lightgreyColor : backgroundColor,
            ),
            child: loading
                ? Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: backgroundColor == AppColors.whiteColor ||
                                backgroundColor == AppColors.transparentColor
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        icon!,
                        if (title != null) gap.horizontalSpace,
                      ],
                      if (title != null)
                        Text(
                          title!,
                          style: titleStyle ??
                              AppStyles.text20PxMedium
                                  .copyWith(color: AppColors.whiteColor),
                          overflow: TextOverflow.clip,
                        ),
                      if (suffix != null) ...[
                        if (title != null) gap.horizontalSpace,
                        suffix!,
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
