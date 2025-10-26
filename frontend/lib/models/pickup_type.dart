// lib/models/pickup_type.dart
enum PickupType { trash, recycling, compost }

extension PickupTypeLabel on PickupType {
  String get label {
    switch (this) {
      case PickupType.trash:
        return 'Trash';
      case PickupType.recycling:
        return 'Recycling';
      case PickupType.compost:
        return 'Compost';
    }
  }

  // Simple emoji for quick UI markers if needed
  String get emoji {
    switch (this) {
      case PickupType.trash:
        return '🗑️';
      case PickupType.recycling:
        return '♻️';
      case PickupType.compost:
        return '🌿';
    }
  }
}
