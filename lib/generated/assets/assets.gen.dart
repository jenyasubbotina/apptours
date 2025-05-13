/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/clock.svg
  SvgGenImage get clock => const SvgGenImage('assets/icons/clock.svg');

  /// File path: assets/icons/flag.svg
  SvgGenImage get flag => const SvgGenImage('assets/icons/flag.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/home_selected.svg
  SvgGenImage get homeSelected =>
      const SvgGenImage('assets/icons/home_selected.svg');

  /// File path: assets/icons/like.svg
  SvgGenImage get like => const SvgGenImage('assets/icons/like.svg');

  /// File path: assets/icons/like_outlined.svg
  SvgGenImage get likeOutlined =>
      const SvgGenImage('assets/icons/like_outlined.svg');

  /// File path: assets/icons/marker.svg
  SvgGenImage get marker => const SvgGenImage('assets/icons/marker.svg');

  /// File path: assets/icons/marker_selected.svg
  SvgGenImage get markerSelected =>
      const SvgGenImage('assets/icons/marker_selected.svg');

  /// File path: assets/icons/pin.svg
  SvgGenImage get pin => const SvgGenImage('assets/icons/pin.svg');

  /// File path: assets/icons/pin_not_selected.svg
  SvgGenImage get pinNotSelected =>
      const SvgGenImage('assets/icons/pin_not_selected.svg');

  /// File path: assets/icons/pin_restaurant.svg
  SvgGenImage get pinRestaurant =>
      const SvgGenImage('assets/icons/pin_restaurant.svg');

  /// File path: assets/icons/pin_selected.svg
  SvgGenImage get pinSelected =>
      const SvgGenImage('assets/icons/pin_selected.svg');

  /// File path: assets/icons/pointer.svg
  SvgGenImage get pointer => const SvgGenImage('assets/icons/pointer.svg');

  /// File path: assets/icons/pointer_selected.svg
  SvgGenImage get pointerSelected =>
      const SvgGenImage('assets/icons/pointer_selected.svg');

  /// File path: assets/icons/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/profile.svg');

  /// File path: assets/icons/profile_selected.svg
  SvgGenImage get profileSelected =>
      const SvgGenImage('assets/icons/profile_selected.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        clock,
        flag,
        home,
        homeSelected,
        like,
        likeOutlined,
        marker,
        markerSelected,
        pin,
        pinNotSelected,
        pinRestaurant,
        pinSelected,
        pointer,
        pointerSelected,
        profile,
        profileSelected
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/frame.png
  AssetGenImage get frame => const AssetGenImage('assets/images/frame.png');

  /// File path: assets/images/pin_not_selected.png
  AssetGenImage get pinNotSelected =>
      const AssetGenImage('assets/images/pin_not_selected.png');

  /// File path: assets/images/pin_rest.png
  AssetGenImage get pinRest =>
      const AssetGenImage('assets/images/pin_rest.png');

  /// File path: assets/images/pin_selected.png
  AssetGenImage get pinSelected =>
      const AssetGenImage('assets/images/pin_selected.png');

  /// File path: assets/images/route_1.png
  AssetGenImage get route1 => const AssetGenImage('assets/images/route_1.png');

  /// File path: assets/images/sign_in.png
  AssetGenImage get signIn => const AssetGenImage('assets/images/sign_in.png');

  /// File path: assets/images/tashkent_background.png
  AssetGenImage get tashkentBackground =>
      const AssetGenImage('assets/images/tashkent_background.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        frame,
        pinNotSelected,
        pinRest,
        pinSelected,
        route1,
        signIn,
        tashkentBackground
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
