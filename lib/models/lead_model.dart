class LeadModel {
  final int carId;
  final String userEmail;
  final String userPhone;

  LeadModel({
    required this.carId,
    required this.userEmail,
    required this.userPhone,
  });

  Map<String, dynamic> toJSON() {
    return {
      'carId': carId,
      'userEmail': userEmail,
      'userPhone': userPhone,
    };
  }
}
