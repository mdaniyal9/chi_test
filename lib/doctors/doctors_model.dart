class GetDoctorContactList {
  final List<GetDoctorContact>? data;
  final int? totalRecords;

  GetDoctorContactList(
    this.data,
    this.totalRecords,
  );

  static GetDoctorContactList fromMap(Map<String, dynamic> resp) {
    List<GetDoctorContact>? data;
    if (resp['data'] != null) {
      data = List<GetDoctorContact>.from(
          resp['data'].map((item) => GetDoctorContact.fromMap(item)));
    }

    return GetDoctorContactList(
      resp['data'] == null ? null : data,
      resp['total_records'] as int?,
    );
  }
}

class GetDoctorContact {
  final String? fullname;
  final String? image;
  final String? gender;
  final String? employeeId;
  final String? userId;

  GetDoctorContact(this.fullname, this.image, this.gender, this.employeeId, this.userId);

  static GetDoctorContact fromMap(Map<String, dynamic> resp) {
    return GetDoctorContact(
        resp['full_name'] as String?,
        resp['image'] as String?,
        resp['gender'] as String?,
        resp['employee_id'].toString(),
        resp['user_id'].toString());
  }

  @override
  String toString() {
    String st = '';
    st += 'Doctor: ${fullname!}';
    return st;
  }
}
