import 'package:chi_test/compliance/compliance_detail/compliance_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ComplianceDetailScreen extends ViewModelBuilderWidget<ComplianceDetailViewModel>{
  const ComplianceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, ComplianceDetailViewModel viewModel, Widget? child) {
    return const Text('Compliance Detail Screen');
  }


  @override
  ComplianceDetailViewModel viewModelBuilder(BuildContext context) {
    return ComplianceDetailViewModel();
  }

}