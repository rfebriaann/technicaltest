class PersonalInfo {
  final int? id;
  final String fullName;
  final String birthDate;
  final String gender;
  final String email;
  final String phoneNumber;
  final String lastEducation;
  final String address;
  final String province;
  final String city;
  final String pos;
  final String company;
  final String position;
  final String? ktpImagePath;

  PersonalInfo({
    this.id,
    required this.fullName,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.lastEducation,
    required this.address,
    required this.province,
    required this.city,
    required this.pos,
    required this.company,
    required this.position,
    this.ktpImagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'birthDate': birthDate,
      'gender': gender,
      'email': email,
      'phoneNumber': phoneNumber,
      'lastEducation': lastEducation,
      'address': address,
      'province': province,
      'city': city,
      'pos': pos,
      'company': company,
      'position': position,
      'ktpImagePath': ktpImagePath,
    };
  }
}
