class AddBookingValidation {
  String? message;
  Errors? errors;

  AddBookingValidation({this.message, this.errors});

  factory AddBookingValidation.fromJson(Map<String, dynamic> json) {
    return AddBookingValidation(
      message: json['message'] as String?,
      errors: json['errors'] != null
          ? Errors.fromJson(json['errors'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'errors': errors?.toJson(),
      };
}

class Errors {
  List<String>? startDate;

  Errors({this.startDate});

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      startDate: json['startDate'] != null
          ? List<String>.from(json['startDate'] as List)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'startDate': startDate,
      };
}
