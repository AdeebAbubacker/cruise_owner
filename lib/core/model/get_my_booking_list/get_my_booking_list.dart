

import 'dart:convert';

class GetMyBookingList {
    final List<BookingData>? data;
    final Links? links;
    final Meta? meta;

    GetMyBookingList({
        this.data,
        this.links,
        this.meta,
    });

    GetMyBookingList copyWith({
        List<BookingData>? data,
        Links? links,
        Meta? meta,
    }) => 
        GetMyBookingList(
            data: data ?? this.data,
            links: links ?? this.links,
            meta: meta ?? this.meta,
        );

    factory GetMyBookingList.fromRawJson(String str) => GetMyBookingList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetMyBookingList.fromJson(Map<String, dynamic> json) => GetMyBookingList(
        data: json["data"] == null ? [] : List<BookingData>.from(json["data"]!.map((x) => BookingData.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
    };
}

class BookingData {
    final int? id;
    final String? invoiceId;
    final String? orderId;
    final int? userId;
    final int? cruiseId;
    final int? packageId;
    final int? bookingTypeId;
    final int? vegCount;
    final int? nonVegCount;
    final int? jainVegCount;
    final int? totalAmount;
    final int? amountPaid;
    final int? balanceAmount;
    final String? customerNote;
    final DateTime? startDate;
    final DateTime? endDate;
    final String? fulfillmentStatus;
    final bool? bookedByUser;
    final bool? isActive;
    final User? user;

    BookingData({
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

    BookingData copyWith({
        int? id,
        String? invoiceId,
        String? orderId,
        int? userId,
        int? cruiseId,
        int? packageId,
        int? bookingTypeId,
        int? vegCount,
        int? nonVegCount,
        int? jainVegCount,
        int? totalAmount,
        int? amountPaid,
        int? balanceAmount,
        String? customerNote,
        DateTime? startDate,
        DateTime? endDate,
        String? fulfillmentStatus,
        bool? bookedByUser,
        bool? isActive,
        User? user,
    }) => 
        BookingData(
            id: id ?? this.id,
            invoiceId: invoiceId ?? this.invoiceId,
            orderId: orderId ?? this.orderId,
            userId: userId ?? this.userId,
            cruiseId: cruiseId ?? this.cruiseId,
            packageId: packageId ?? this.packageId,
            bookingTypeId: bookingTypeId ?? this.bookingTypeId,
            vegCount: vegCount ?? this.vegCount,
            nonVegCount: nonVegCount ?? this.nonVegCount,
            jainVegCount: jainVegCount ?? this.jainVegCount,
            totalAmount: totalAmount ?? this.totalAmount,
            amountPaid: amountPaid ?? this.amountPaid,
            balanceAmount: balanceAmount ?? this.balanceAmount,
            customerNote: customerNote ?? this.customerNote,
            startDate: startDate ?? this.startDate,
            endDate: endDate ?? this.endDate,
            fulfillmentStatus: fulfillmentStatus ?? this.fulfillmentStatus,
            bookedByUser: bookedByUser ?? this.bookedByUser,
            isActive: isActive ?? this.isActive,
            user: user ?? this.user,
        );

    factory BookingData.fromRawJson(String str) => BookingData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        id: json["id"],
        invoiceId: json["invoice_id"],
        orderId: json["orderId"],
        userId: json["userId"],
        cruiseId: json["cruise_id"],
        packageId: json["packageId"],
        bookingTypeId: json["bookingTypeId"],
        vegCount: json["vegCount"],
        nonVegCount: json["nonVegCount"],
        jainVegCount: json["jainVegCount"],
        totalAmount: json["totalAmount"],
        amountPaid: json["amountPaid"],
        balanceAmount: json["balanceAmount"],
        customerNote: json["customerNote"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        fulfillmentStatus: json["fulfillmentStatus"],
        bookedByUser: json["bookedByUser"],
        isActive: json["isActive"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "invoice_id": invoiceId,
        "orderId": orderId,
        "userId": userId,
        "cruise_id": cruiseId,
        "packageId": packageId,
        "bookingTypeId": bookingTypeId,
        "vegCount": vegCount,
        "nonVegCount": nonVegCount,
        "jainVegCount": jainVegCount,
        "totalAmount": totalAmount,
        "amountPaid": amountPaid,
        "balanceAmount": balanceAmount,
        "customerNote": customerNote,
        "startDate": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "fulfillmentStatus": fulfillmentStatus,
        "bookedByUser": bookedByUser,
        "isActive": isActive,
        "user": user?.toJson(),
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;
    final String? phoneNumber;
    final String? googleId;
    final String? countryCode;
    final String? imagePath;

    User({
        this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.googleId,
        this.countryCode,
        this.imagePath,
    });

    User copyWith({
        int? id,
        String? name,
        String? email,
        String? phoneNumber,
        String? googleId,
        String? countryCode,
        String? imagePath,
    }) => 
        User(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            googleId: googleId ?? this.googleId,
            countryCode: countryCode ?? this.countryCode,
            imagePath: imagePath ?? this.imagePath,
        );

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        googleId: json["google_id"],
        countryCode: json["countryCode"],
        imagePath: json["image_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "google_id": googleId,
        "countryCode": countryCode,
        "image_path": imagePath,
    };
}

class Links {
    final String? first;
    final String? last;
    final dynamic prev;
    final String? next;

    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    Links copyWith({
        String? first,
        String? last,
        dynamic prev,
        String? next,
    }) => 
        Links(
            first: first ?? this.first,
            last: last ?? this.last,
            prev: prev ?? this.prev,
            next: next ?? this.next,
        );

    factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    final int? currentPage;
    final int? from;
    final int? lastPage;
    final List<Link>? links;
    final String? path;
    final int? perPage;
    final int? to;
    final int? total;

    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    Meta copyWith({
        int? currentPage,
        int? from,
        int? lastPage,
        List<Link>? links,
        String? path,
        int? perPage,
        int? to,
        int? total,
    }) => 
        Meta(
            currentPage: currentPage ?? this.currentPage,
            from: from ?? this.from,
            lastPage: lastPage ?? this.lastPage,
            links: links ?? this.links,
            path: path ?? this.path,
            perPage: perPage ?? this.perPage,
            to: to ?? this.to,
            total: total ?? this.total,
        );

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}

class Link {
    final String? url;
    final String? label;
    final bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    Link copyWith({
        String? url,
        String? label,
        bool? active,
    }) => 
        Link(
            url: url ?? this.url,
            label: label ?? this.label,
            active: active ?? this.active,
        );

    factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
