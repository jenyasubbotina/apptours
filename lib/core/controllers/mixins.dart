import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

mixin ReactionDisposerMixin<T extends StatefulWidget> on State<T> {
  final List<ReactionDisposer> _reactions = [];
  List<ReactionDisposer> get reactions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_reactions.isEmpty) {
      _reactions.addAll(reactions);
    }
  }

  @override
  void dispose() {
    for (var dispose in _reactions) {
      dispose();
    }
    super.dispose();
  }
}