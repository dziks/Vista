class User {
  String staffName;
  int staffNumber;

  User({this.staffName, this.staffNumber});

  User.fromJson(Map<String, dynamic> json) {
    staffName = json['StaffName'];
    staffNumber = json['StaffNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StaffName'] = this.staffName;
    data['StaffNumber'] = this.staffNumber;
    return data;
  }
}
