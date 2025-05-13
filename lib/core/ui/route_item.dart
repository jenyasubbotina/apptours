import 'dart:async';

import 'package:flutter/material.dart' hide Route;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/core/ui/blurred_container.dart';
import 'package:apptours/core/ui/like_button.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/core/ui/route_complexity.dart';
import 'package:apptours/generated/assets/assets.gen.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:apptours/main.dart';

class RouteItem extends StatefulWidget {
  final Route route;
  final bool showStartButton;
  final VoidCallback? onStartRoute;

  const RouteItem({
    required this.route,
    this.showStartButton = false,
    required this.onStartRoute,
    super.key,
  });

  @override
  State<RouteItem> createState() => _RouteItemState();
}

class _RouteItemState extends State<RouteItem> {
  final _service = di.get<ApiService>();

  Future<bool> Function(bool liked) get _onLikeClick =>
      (liked) async => _service.updateLikedRoute(id: widget.route.pk, liked: liked);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return InkWell(
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: AppColors.border),
        ),
        clipBehavior: Clip.hardEdge,
        borderOnForeground: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 160,
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.route.image,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: LikeButton(
                      liked: widget.route.liked,
                      onPressed: _onLikeClick,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlurredContainer(
                        height: 30,
                        borderRadius: 6,
                        horizontalPadding: 10,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: SvgPicture.asset(Assets.icons.clock.path),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              s.text_hrs(widget.route.duration_fast.substring(0, 2)),
                              style: const TextStyle(
                                color: AppColors.light,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BlurredContainer(
                        height: 30,
                        borderRadius: 6,
                        horizontalPadding: 10,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                              height: 15,
                              child: SvgPicture.asset(Assets.icons.flag.path),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              s.text_km(widget.route.length ~/ 1000),
                              style: const TextStyle(
                                color: AppColors.light,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.route.name,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RouteComplexity(widget.route.difficulty),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      widget.route.description,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.secondary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.showStartButton,
                    replacement: const SizedBox(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        height: 44,
                        width: MediaQuery.sizeOf(context).width,
                        child: ElevatedButton(
                          onPressed: widget.onStartRoute,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.dark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              s.label_start_this_tour,
                              style: const TextStyle(
                                color: AppColors.light,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
