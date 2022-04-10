class UserDataModel {
  final String? fName;
  final String? phoneNumber;
  final String? revaMail;
  final String? srn;

  UserDataModel({this.fName, this.phoneNumber, this.revaMail, this.srn});

  factory UserDataModel.fromMap(Map data) {
    return UserDataModel(
      fName: data['fName'],
      phoneNumber: data['phoneNumber'],
      revaMail: data['revaMail'],
      srn: data['srn'],
    );
  }
}
