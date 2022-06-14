import 'package:chi_test/doctors/doctors_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DoctorsScreen extends ViewModelBuilderWidget<DoctorsViewModel> {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, DoctorsViewModel viewModel,
      Widget? child) {
    return const Text('Doctor Screen');
  }

  @override
  DoctorsViewModel viewModelBuilder(BuildContext context) {
    return DoctorsViewModel();
  }

}