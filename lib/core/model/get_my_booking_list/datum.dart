import 'user.dart';

class Datum {
	int? id;
	String? invoiceId;
	String? orderId;
	int? userId;
	int? cruiseId;
	int? packageId;
	int? bookingTypeId;
	int? vegCount;
	int? nonVegCount;
	int? jainVegCount;
	int? totalAmount;
	int? amountPaid;
	int? balanceAmount;
	String? customerNote;
	String? startDate;
	String? endDate;
	String? fulfillmentStatus;
	bool? bookedByUser;
	bool? isActive;
	User? user;

	Datum({
		this.id, 
		this.invoiceId, 
		this.orderId, 
		this.userId, 
		this.cruiseId, 
		this.packageId, 
		this.bookingTypeId, 
		this.vegCount, 
		this.nonVegCount, 
		this.jainVegCount, 
		this.totalAmount, 
		this.amountPaid, 
		this.balanceAmount, 
		this.customerNote, 
		this.startDate, 
		this.endDate, 
		this.fulfillmentStatus, 
		this.bookedByUser, 
		this.isActive, 
		this.user, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				invoiceId: json['invoice_id'] as String?,
				orderId: json['orderId'] as String?,
				userId: json['userId'] as int?,
				cruiseId: json['cruise_id'] as int?,
				packageId: json['packageId'] as int?,
				bookingTypeId: json['bookingTypeId'] as int?,
				vegCount: json['vegCount'] as int?,
				nonVegCount: json['nonVegCount'] as int?,
				jainVegCount: json['jainVegCount'] as int?,
				totalAmount: json['totalAmount'] as int?,
				amountPaid: json['amountPaid'] as int?,
				balanceAmount: json['balanceAmount'] as int?,
				customerNote: json['customerNote'] as String?,
				startDate: json['startDate'] as String?,
				endDate: json['endDate'] as String?,
				fulfillmentStatus: json['fulfillmentStatus'] as String?,
				bookedByUser: json['bookedByUser'] as bool?,
				isActive: json['isActive'] as bool?,
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'invoice_id': invoiceId,
				'orderId': orderId,
				'userId': userId,
				'cruise_id': cruiseId,
				'packageId': packageId,
				'bookingTypeId': bookingTypeId,
				'vegCount': vegCount,
				'nonVegCount': nonVegCount,
				'jainVegCount': jainVegCount,
				'totalAmount': totalAmount,
				'amountPaid': amountPaid,
				'balanceAmount': balanceAmount,
				'customerNote': customerNote,
				'startDate': startDate,
				'endDate': endDate,
				'fulfillmentStatus': fulfillmentStatus,
				'bookedByUser': bookedByUser,
				'isActive': isActive,
				'user': user?.toJson(),
			};
}
