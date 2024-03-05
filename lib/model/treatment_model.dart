class TreatmentModel {
  int id;
  String name;
  String duration;
  String price;
  bool isActive;
  String createdAt;
  String updatedAt;

  TreatmentModel({
    required this.id,
    required this.name,
    required this.duration,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      duration: json['duration'] ?? '',
      price: json['price'] ?? '',
      isActive: json['is_active'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

// class Branch {
//   int id;
//   String name;
//   int patientsCount;
//   String location;
//   String phone;
//   String mail;
//   String address;
//   String gst;
//   bool isActive;

//   Branch({
//     required this.id,
//     required this.name,
//     required this.patientsCount,
//     required this.location,
//     required this.phone,
//     required this.mail,
//     required this.address,
//     required this.gst,
//     required this.isActive,
//   });

//   factory Branch.fromJson(Map<String, dynamic> json) {
//     return Branch(
//       id: json['id'],
//       name: json['name'],
//       patientsCount: json['patients_count'],
//       location: json['location'],
//       phone: json['phone'],
//       mail: json['mail'],
//       address: json['address'],
//       gst: json['gst'],
//       isActive: json['is_active'],
//     );
//   }
// }
