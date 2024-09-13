import 'package:alice_lightweight/core/alice_core.dart';
import 'package:alice_lightweight/core/alice_dio_interceptor.dart';
import 'package:alice_lightweight/ui/page/alice_calls_list_screen.dart';
import 'package:alice_lightweight/utils/alice_custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class AliceService {
  AliceService(GlobalKey<NavigatorState> navigatorKey) {
    _aliceCore = AliceCore(
      navigatorKey,
      const AliceCustomColors(),
    );

    ShakeDetector.autoStart(
      onPhoneShake: _navigateToAliceCallListView,
      shakeThresholdGravity: 4,
    );
  }

  late AliceCore _aliceCore;

  bool _isOpen = false;

  void _navigateToAliceCallListView() {
    final BuildContext? context = _aliceCore.getContext();

    if (context != null && !_isOpen) {
      _isOpen = true;

      Navigator.of(context)
          .push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => AliceCallsListScreen(
            _aliceCore,
            const AliceCustomColors(),
          ),
        ),
      )
          .then(
            (_) {
          _isOpen = false;
        },
      );
    }
  }

  AliceDioInterceptor get dioInterceptor => AliceDioInterceptor(_aliceCore);
}
