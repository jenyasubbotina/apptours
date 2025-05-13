import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:apptours/app/home/controllers/hex_color.dart';
import 'package:apptours/core/model/place.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/app/main/ui/apptours.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    required this.place,
    this.fromMap = false,
    super.key,
  });

  final Place place;
  final bool fromMap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.place, arguments: [place, false]);
      },
      child: SizedBox(
        height: 140,
        child: Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: AppColors.border),
          ),
          clipBehavior: Clip.hardEdge,
          borderOnForeground: true,
          child: Row(
            children: [
              Image.network(
                place.main_image ?? "",
                fit: BoxFit.cover,
                width: 96,
                height: 130,
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 22,
                        child: Row(
                          children: [
                            if (place.category != null)
                              TextButton(
                                onPressed: null,
                                style: TextButton.styleFrom(
                                    backgroundColor: HexColor(place.category?.bg_color ?? "#ffffff")),
                                child: Text(
                                  (place.category!.name).toUpperCase(),
                                  style: TextStyle(
                                      color: HexColor(place.category?.text_color ?? "#000000"),
                                      fontSize: 9,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: TextButton.icon(
                                onPressed: null,
                                icon: const Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.iconsGreen,
                                  size: 12,
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColors.greyLight,
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                ),
                                label: Text(
                                  place.address,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Flexible(
                        child: Text(
                          place.short_description ?? '',
                          overflow: TextOverflow.fade,
                          // softWrap: true,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
