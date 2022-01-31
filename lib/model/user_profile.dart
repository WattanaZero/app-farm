class ProfileData {
  String? status;
  String? message;
  Profile? data;

  ProfileData({this.status, this.message, this.data});

  ProfileData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? new Profile.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Profile {
  int? employeeId;
  String? username;
  String? firstName;
  String? lastName;
  String? password;
  String? dateOfBirth;
  String? mobile;
  String? email;
  String? createBy;
  String? createDate;
  String? updateBy;
  String? updateDate;
  String? roleCode;
  String? fullname;

  Profile(
      { this.employeeId,
       this.username,
       this.firstName,
       this.lastName,
       this.password,
       this.dateOfBirth,
       this.mobile,
       this.email,
       this.createBy,
       this.createDate,
       this.updateBy,
       this.updateDate,
       this.roleCode,
       this.fullname
       });

  Profile.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    dateOfBirth = json['dateOfBirth'];
    mobile = json['mobile'];
    email = json['email'];
    createBy = json['createBy'];
    createDate = json['createDate'];
    updateBy = json['updateBy'];
    updateDate = json['updateDate'];
    roleCode = json['roleCode'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['password'] = this.password;
    data['dateOfBirth'] = this.dateOfBirth;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['createBy'] = this.createBy;
    data['createDate'] = this.createDate;
    data['updateBy'] = this.updateBy;
    data['updateDate'] = this.updateDate;
    data['roleCode'] = this.roleCode;
    data['fullname'] = this.fullname;
    return data;
  }
}
