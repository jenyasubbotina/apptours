import 'package:flutter/material.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/generated/l10n.dart';

class RouteComplexity extends StatelessWidget {
  const RouteComplexity(this.complexity, {super.key});

  final int complexity;

  Color get color => switch (complexity) {
        1 => AppColors.aquamarine,
        2 => AppColors.green,
        3 => AppColors.yellow,
        4 => AppColors.red,
        5 => AppColors.burgundy,
        _ => AppColors.grey,
      };
  Color get colorLight => switch (complexity) {
        1 => AppColors.aquamarineLight,
        2 => AppColors.greenLight,
        3 => AppColors.yellowLight,
        4 => AppColors.redLight,
        5 => AppColors.burgundyLight,
        _ => AppColors.grey,
      };

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final text = switch (complexity) {
      1 => s.label_very_easy,
      2 => s.label_easy,
      3 => s.label_medium,
      4 => s.label_hard,
      5 => s.label_extreme,
      _ => s.error_not_found,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index < complexity ? color : colorLight,
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 6),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
