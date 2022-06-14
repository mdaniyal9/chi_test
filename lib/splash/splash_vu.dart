import 'package:chi_test/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends ViewModelBuilderWidget<SplashViewModel> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    return const Text('Splash Screen');
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) {
    return SplashViewModel();
  }
}
