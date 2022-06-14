class ComplianceDetailList {
  final List<ComplianceDetail>? data;
  final int? total;
  final int? totalRecords;

  ComplianceDetailList(
    this.data,
    this.total,
    this.totalRecords,
  );

  static ComplianceDetailList fromMap(Map<String, dynamic> resp) {
    List<ComplianceDetail>? data;
    if (resp['data'] != null) {
      data = List<ComplianceDetail>.from(
          resp['data'].map((item) => ComplianceDetail.fromMap(item)));
    }

    return ComplianceDetailList(
      resp['data'] == null ? null : data,
      resp['total'] as int?,
      resp['total_records'] as int?,
    );
  }
}

class ComplianceDetail {
  final String? serviceName;
  final String? serviceNameToDisplay;
  final int? dueTime;
  final int? takenTime;
  final String? icon;
  final String? resultStatus;
  final String? result;
  final String? status;

  ComplianceDetail(
    this.serviceName,
    this.serviceNameToDisplay,
    this.dueTime,
    this.takenTime,
    this.icon,
    this.resultStatus,
    this.result,
    this.status,
  );

  static ComplianceDetail fromMap(Map<String, dynamic> resp) {
    return ComplianceDetail(
      resp['service_name'] as String?,
      resp['service_name_to_display'] as String?,
      resp['due_time'] as int?,
      resp['taken_time'] as int?,
      resp['icon'] as String?,
      resp['result_status'] as String?,
      resp['result'] as String?,
      resp['status'] as String?,
    );
  }
}
