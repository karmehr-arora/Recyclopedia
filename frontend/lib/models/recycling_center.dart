// lib/models/recycling_center.dart

/// Basic info your UI needs to show a local recycling program/center.
class RecyclingCenter {
  final int? id;
  final String name;
  final String address;
  final String? phone;
  final String? website;
  final String? hours;
  final String? notes;

  /// What materials they accept (e.g., “PET (#1)”, “HDPE (#2)”, “Glass”)
  final String? accepts;

  const RecyclingCenter({
    required this.id,
    required this.name,
    required this.address,
    this.phone,
    this.website,
    this.hours,
    this.notes,
    this.accepts,
  });
  factory RecyclingCenter.fromJson(Map<String, dynamic> json) {
    return RecyclingCenter(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      website: json['website'],
      hours: json['hours'],
      notes: json['notes'],
      accepts: json['accepts'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'phone': phone,
    'website': website,
    'hours': hours,
    'notes': notes,
    'accepts': accepts,
  };
}
