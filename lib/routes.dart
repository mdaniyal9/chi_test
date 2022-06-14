import 'package:chi_test/login/login_vu.dart';
import 'package:chi_test/splash/splash_vu.dart';
import 'package:flutter/material.dart';

import 'compliance/compliance_detail/compliance_detail_vu.dart';
import 'doctors/doctors_vu.dart';

Map<String, WidgetBuilder> appRoutes = {
// Auth Screens
  '/': (context) => const SplashScreen(),
  '/login': (context) => const LoginScreen(),
  '/detail_compliance': (context) => const ComplianceDetailScreen(),
  '/doctor': (context) => const DoctorsScreen(),
};