/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $HtmlGen {
  const $HtmlGen();

  /// File path: html/home_html.html
  String get homeHtml => 'html/home_html.html';

  /// List of all assets
  List<String> get values => [homeHtml];
}

class $ImageGen {
  const $ImageGen();

  /// File path: image/loginfail_headimage.png
  AssetGenImage get loginfailHeadimage =>
      const AssetGenImage('image/loginfail_headimage.png');

  /// File path: image/school_map.jpg
  AssetGenImage get schoolMap => const AssetGenImage('image/school_map.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [loginfailHeadimage, schoolMap];
}

class $SvgsGen {
  const $SvgsGen();

  /// File path: svgs/dark_mode.svg
  String get darkMode => 'svgs/dark_mode.svg';

  /// File path: svgs/day_mode.svg
  String get dayMode => 'svgs/day_mode.svg';

  /// File path: svgs/forum_record.svg
  String get forumRecord => 'svgs/forum_record.svg';

  /// File path: svgs/group.svg
  String get group => 'svgs/group.svg';

  /// File path: svgs/school.svg
  String get school => 'svgs/school.svg';

  /// File path: svgs/school_map.svg
  String get schoolMap => 'svgs/school_map.svg';

  /// File path: svgs/sign_record.svg
  String get signRecord => 'svgs/sign_record.svg';

  /// List of all assets
  List<String> get values =>
      [darkMode, dayMode, forumRecord, group, school, schoolMap, signRecord];
}

class Assets {
  Assets._();

  static const $HtmlGen html = $HtmlGen();
  static const $ImageGen image = $ImageGen();
  static const $SvgsGen svgs = $SvgsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
