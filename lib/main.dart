import 'package:dr_appointment_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main()async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  
  runApp( DocApp(
    appRouter: AppRouter(),
  ));
}
 