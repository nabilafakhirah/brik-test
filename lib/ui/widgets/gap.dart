import 'package:flutter/cupertino.dart';

class Gap extends SizedBox {
  const Gap({super.key, super.width, super.height});

  /// Creates a box whose width is set and height is 0.
  const Gap.horizontal(double width, {super.key, super.child})
      : super(width: width, height: 0.0);

  /// Creates a box whose height is set and width is 0.
  const Gap.vertical(double height, {super.key, super.child})
      : super(width: 0.0, height: height);
}