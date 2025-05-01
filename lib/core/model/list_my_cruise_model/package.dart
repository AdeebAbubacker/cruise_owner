class Package {
  int? id;
  int? cruiseId;
  String? name;
  String? description;
  String? slug;
  bool? isActive;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<BookingType>? bookingTypes;
  Package({
    this.id,
    this.cruiseId,
    this.name,
    this.description,
    this.slug,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.bookingTypes,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json['id'] as int?,
        cruiseId: json['cruise_id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        slug: json['slug'] as String?,
        isActive: json['is_active'] as bool?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        bookingTypes: (json['booking_types'] as List<dynamic>?)
            ?.map((e) => BookingType.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cruise_id': cruiseId,
        'name': name,
        'description': description,
        'slug': slug,
        'is_active': isActive,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

class BookingType {
  int? id;
  String? name;
  String? icon;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  BookingPivot? pivot;

  BookingType({
    this.id,
    this.name,
    this.icon,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory BookingType.fromJson(Map<String, dynamic> json) {
    return BookingType(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot:
          json['pivot'] != null ? BookingPivot.fromJson(json['pivot']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pivot': pivot?.toJson(),
    };
  }
}

class BookingPivot {
  int? packageId;
  int? bookingTypeId;
  String? price;
  String? pricePerDay;
  String? comparePrice;
  String? minAmountToPay;
  String? pricePerPerson;
  String? pricePerBed;

  BookingPivot({
    this.packageId,
    this.bookingTypeId,
    this.price,
    this.pricePerDay,
    this.comparePrice,
    this.minAmountToPay,
    this.pricePerPerson,
    this.pricePerBed,
  });

  factory BookingPivot.fromJson(Map<String, dynamic> json) {
    return BookingPivot(
      packageId: json['package_id'],
      bookingTypeId: json['booking_type_id'],
      price: json['price'],
      pricePerDay: json['price_per_day'],
      comparePrice: json['compare_price'],
      minAmountToPay: json['min_amount_to_pay'],
      pricePerPerson: json['price_per_person'],
      pricePerBed: json['price_per_bed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'package_id': packageId,
      'booking_type_id': bookingTypeId,
      'price': price,
      'price_per_day': pricePerDay,
      'compare_price': comparePrice,
      'min_amount_to_pay': minAmountToPay,
      'price_per_person': pricePerPerson,
      'price_per_bed': pricePerBed,
    };
  }
}
