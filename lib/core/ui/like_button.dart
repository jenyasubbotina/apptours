import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:apptours/app/home/controllers/routes_controller.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/generated/assets/assets.gen.dart';
import 'package:apptours/main.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    required this.liked,
    required this.onPressed,
    this.size = 40,
    this.isWhite = false,
    this.refetchRoutes = false,
    super.key,
  });

  const LikeButton.white({
    required this.liked,
    required this.onPressed,
    this.size = 40,
    this.refetchRoutes = false,
    super.key,
  }) : isWhite = true;

  final bool liked;
  final Future<bool> Function(bool isLiked) onPressed;
  final double size;
  final bool isWhite;
  final bool refetchRoutes;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  bool get isWhite => widget.isWhite;

  @override
  void initState() {
    super.initState();
    isLiked = widget.liked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
        widget.onPressed(isLiked).then((liked) {
          setState(() => isLiked = liked);
          if (widget.refetchRoutes) di.get<RoutesListStore>().load(null);
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: isWhite
            ? null
            : const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.light,
              ),
        child: SizedBox(
          width: isWhite ? widget.size : widget.size / 2,
          height: isWhite ? widget.size : widget.size / 2,
          child: Center(
            child: SvgPicture.asset(
              isLiked ? Assets.icons.like.path : Assets.icons.likeOutlined.path,
              color: isWhite ? AppColors.light : null,
            ),
          ),
        ),
      ),
    );
  }
}
