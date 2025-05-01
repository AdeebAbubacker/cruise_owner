import 'package:hive_flutter/hive_flutter.dart';
part 'package_details_adapter.g.dart';

@HiveType(typeId: 2)
class PackageDetailsDB {
  @HiveField(0)
  String? packageId;

  @HiveField(1)
  String? bookingTypeId;

  @HiveField(2)
  DateTime? startDate;

  @HiveField(3)
  DateTime? endDate;

  @HiveField(4)
  double? totalAmount;
  @HiveField(5)
  String? cruiseImage;
  @HiveField(6)
  String? cruiseName;
  @HiveField(7)
  String? packageName;

  PackageDetailsDB({
    this.packageId,
    this.bookingTypeId,
    this.startDate,
    this.endDate,
    this.totalAmount,
    this.cruiseImage,
    this.cruiseName,
    this.packageName,
  });

  factory PackageDetailsDB.fromJson(Map<String, dynamic> json) {
    return PackageDetailsDB(
      packageId: json['packageId'] != null
          ? json['packageId'].toString()
          : null,
      bookingTypeId: json['bookingTypeId'] != null
          ? json['bookingTypeId'].toString()
          : null,
      startDate: json['startDate'] != null
          ? DateTime.tryParse(json['startDate'])
          : null,
      endDate:
          json['endDate'] != null ? DateTime.tryParse(json['endDate']) : null,
      totalAmount: json['totalAmount'] != null
          ? double.tryParse(json['totalAmount'].toString())
          : null,
      cruiseImage: json['cruiseImage'],
      cruiseName: json['cruiseName'],
      packageName: json['packageName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['packageId'] = packageId;
    data['bookingTypeId'] = bookingTypeId;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['totalAmount'] = totalAmount;
    data['cruiseImage'] = cruiseImage;
    data['cruiseName'] = cruiseName;
    data['packageName'] = packageName;
    return data;
  }
}
