import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_vm.dart';

class LoginScreen extends ViewModelBuilderWidget<LoginViewModel> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return const Text('Login Screen');
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) {
    return LoginViewModel();
  }
}
