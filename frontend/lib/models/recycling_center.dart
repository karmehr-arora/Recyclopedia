// lib/models/recycling_center.dart

/// Basic info your UI needs to show a local recycling program/center.
class RecyclingCenter {
  final String id;
  final String name;
  final String address;
  final String? phone;
  final String? website;

  /// What materials they accept (e.g., “PET (#1)”, “HDPE (#2)”, “Glass”)
  final List<String> accepts;

  final String? hours;
  final String? notes;

  const RecyclingCenter({
    required this.id,
    required this.name,
    required this.address,
    this.phone,
    this.website,
    required this.accepts,
    this.hours,
    this.notes,
  });
}
