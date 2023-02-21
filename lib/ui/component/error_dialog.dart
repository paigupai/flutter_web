import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../model/platform_exception.dart';

void showSnackBarOnError(
    BuildContext context, dynamic error, StackTrace stackTrace) {
  if (kDebugMode) {
    print('error: $error');
  }
  if (error is PlatformException) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: error.message,
      ),
    );
  }
}
