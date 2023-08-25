import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kursovay/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.avatar).existsSync(), true);
    expect(File(AppImages.screensaver).existsSync(), true);
  });
}
