import 'package:flutter/material.dart';
import 'package:apptours/app/home/controllers/hex_color.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/generated/l10n.dart';

import '../model/category.dart';

class PlaceCategory extends StatelessWidget {
  const PlaceCategory({
    required this.category,
    this.onPressed,
    this.selected = false,
    super.key,
  });

  final Category category;
  final VoidCallback? onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(HexColor(category.bg_color)),
        elevation: MaterialStateProperty.all<double>(selected ? 0 : 2),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              width: 2,
              color: selected ? AppColors.green : HexColor(category.bg_color),
            ),
          ),
        ),
      ),
      child: Text(
        category.name.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: HexColor(category.text_color),
        ),
      ),
    );
  }
}
