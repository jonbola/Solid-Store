class SupplierModel {
  final int? supplierId;
  final String name;
  final String contactName;
  final String phone;
  final String address;

  const SupplierModel({
    this.supplierId,
    required this.name,
    required this.contactName,
    required this.phone,
    required this.address,
  });

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
        supplierId: json['SupplierId'],
        name: json['Name'],
        contactName: json['ContactName'],
        phone: json['Phone'],
        address: json['Address'],
      );

  Map<String, dynamic> toJson() => {
        'SupplierId': supplierId,
        'Name': name,
        'ContactName': contactName,
        'Phone': phone,
        'Address': address,
      };
}