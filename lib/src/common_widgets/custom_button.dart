import 'package:flutter/material.dart';
import 'package:summit_rock/src/common_widgets/animated_loading_dots.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onTap,
    this.horizontalPadding = 52.0,
    this.verticalPadding = 12.0,
    this.shrinkWrap = false,
    this.loading = false,
    this.transparentStyle = false,
    this.flex = 2,
    this.leadingIcon,
    this.trailingIcon,
    this.color,
    Key? key,
  }) : super(key: key);

  final String text;
  final void Function()? onTap;
  final double horizontalPadding;
  final double verticalPadding;
  final bool shrinkWrap;
  final bool loading;
  final bool transparentStyle;
  final int flex;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (shrinkWrap) const Spacer(),
        Expanded(
          flex: !shrinkWrap ? flex : 0,
          child: transparentStyle
              ? _TransparentStyleButton(
                  text: text,
                  horizontalPadding: shrinkWrap ? horizontalPadding : 20.0,
                  verticalPadding: verticalPadding,
                  loading: loading,
                  leadingIcon: leadingIcon,
                  trailingIcon: trailingIcon,
                  transparentStyle: transparentStyle,
                  onTap: onTap)
              : _FilledStyleButton(
                  text: text,
                  horizontalPadding: shrinkWrap ? horizontalPadding : 20.0,
                  verticalPadding: verticalPadding,
                  loading: loading,
                  leadingIcon: leadingIcon,
                  trailingIcon: trailingIcon,
                  color: color,
                  onTap: onTap),
        ),
        if (shrinkWrap) const Spacer(),
      ],
    );
  }
}

class _FilledStyleButton extends StatelessWidget {
  const _FilledStyleButton({
    required this.text,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.loading,
    required this.onTap,
    this.leadingIcon,
    this.trailingIcon,
    this.color,
  });

  final String text;
  final void Function()? onTap;
  final double horizontalPadding;
  final double verticalPadding;
  final bool loading;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        shape: const StadiumBorder(),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
      ),
      onPressed: onTap,
      child: Center(
        child: loading
            // ? const AnimatedFlashingDots()
            ? AnimatedLoadingDots(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leadingIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(leadingIcon),
                    ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          // color: Theme.of(context).colorScheme.onPrimary,
                          color: onTap != null
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).unselectedWidgetColor,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.31,
                        ),
                  ),
                  if (trailingIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(trailingIcon),
                    ),
                ],
              ),
      ),
    );
  }
}

class _TransparentStyleButton extends StatelessWidget {
  const _TransparentStyleButton({
    required this.text,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.loading,
    required this.transparentStyle,
    required this.onTap,
    this.leadingIcon,
    this.trailingIcon,
  });

  final String text;
  final void Function()? onTap;
  final double horizontalPadding;
  final double verticalPadding;
  final bool loading;
  final bool transparentStyle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: transparentStyle
            ? Theme.of(context).colorScheme.primary.withOpacity(0.27)
            : Theme.of(context).colorScheme.primary,
        // : Theme.of(context).cardColor,
        shape: const StadiumBorder(),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
      ),
      onPressed: onTap,
      child: Center(
        child: loading
            // ? const AnimatedFlashingDots()
            ? const AnimatedLoadingDots()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leadingIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(leadingIcon),
                    ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: onTap != null
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).unselectedWidgetColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.31,
                        ),
                  ),
                  if (trailingIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(trailingIcon),
                    ),
                ],
              ),
      ),
    );
  }
}
