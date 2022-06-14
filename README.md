# chi_test

There should be no warnings in any file
You are only allowed to use Listview.builder and TextFormField once. 


Make a component of text form field and use it for both username and password fields

#TextFormFieldWidget(
#  viewModel.validateController,
#  hint: 'Password',
#  icon: 'assets/images/password.png',
#  validateString: 'Password is required',
#  onValidate: (value) {
#  },
#  isPasswordField: true,
#),



Make a component of listview and use it in both doctor and compliance detail screen.

your widget should accept at least these parameters you can add more parameters if you like
your widget should be able to perform 
        - pull to refresh
        - pagination
        - search
        - api call

#GenericListView(
#   title: "Group Compliance",
#   search: true,
#   dataList: List,
#   cellDesign: cellDesign,
#   fromJson: Model.fromMap,
#   request: viewModel.req,
#   endPoint: 'api/doctor_app/Contacts',
#   apiResponseType: dynamic,
#),


end point for doctors => 'api/doctor_app/Contacts'
end point for detail compliance => 'api/doctor_app/DetailCompliance'

request for doctor
#final Map<String, dynamic> req = {
#'app_type': 'Patient',
#'episode_id': 'G6LXS7FRA7',
#'columns': [
#'user_id',
#'employee_no',
#'image',
#'full_name',
#'user.primary_group.group_name',
#'gender',
#'mobile_phone',
#'date_added',
#'date_updated'
#],
#'limit': 30,
#'offset': 0,
#'app_version': '3.2.10-000',
#'os_name': 'Android',
#'search': '',
#};

request for detail compliance
#final Map<String, dynamic>req = {
#'episode_id': 'G6LXS7FRA7',
#'limit': 30,
#'offset': 0,
#'screen': 'Medicine',
#'service_name': 'PANADOL',
#'status': 'Missed'
#};