import 'package:flutter/material.dart';

class BttCardTarefas extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? splashColor;

  final double? elevation;
  final double radius;
  final double ph;
  final double pv;

  final double? width;
  final double? height;

  final bool centered;
  final Color? colorBg;

  final List<Widget>? content;
  final Widget? child;
  final String? text;
  final TextStyle? textStyle;

  const BttCardTarefas({
    Key? key,
    this.onTap,
    this.splashColor,
    this.radius = 4,
    this.elevation,
    this.ph = 8,
    this.pv = 8,
    this.centered = false,
    this.content,
    this.child,
    this.colorBg, this.text, this.textStyle, this.width, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 4,
      color: colorBg ?? Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        splashColor: splashColor ?? Colors.grey.shade200,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: ph,
            vertical: pv,
          ),
          child: Builder(
            builder: (ctx) {
              if(content != null && child == null) {
                return Row(
                  mainAxisAlignment: centered
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: content!,
                );
              }
              if(content == null && child != null) {
                return Center(
                  child: child,
                );
              }

              if(content == null && child == null && text != null) {
                return Text(
                  text!,
                  style: textStyle ?? const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}