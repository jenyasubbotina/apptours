import 'package:flutter/material.dart';

class FixedStateProperty<T> extends MaterialStateProperty<T> {
  final T value;

  FixedStateProperty(this.value);

  @override
  T resolve(Set<MaterialState> states) => value;
}

class InteractiveColorStateProperty extends MaterialStateProperty<Color> {
  final Color normal;
  final Color focused;
  final Color pressed;
  final Color disabled;

  InteractiveColorStateProperty({
    required this.normal,
    required this.focused,
    required this.pressed,
    required this.disabled,
  });

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return disabled;
    if (states.contains(MaterialState.pressed)) return pressed;
    if (states.contains(MaterialState.focused)) return focused;
    return normal;
  }
}