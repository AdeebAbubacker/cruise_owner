import 'dart:async';
import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/favourites_list_model/favourites_list_model.dart';
import 'package:cruise_buddy/core/model/posted_favouritem_item_model/posted_favouritem_item_model.dart';
import 'package:cruise_buddy/core/model/validation/add_booking_validation/add_booking_validation.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;

class OwnerBookingService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = 'https://cruisebuddy.in/api/v1';

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
    // Bearer token will be added dynamically to the headers
  };
Future<Either<dynamic, String>> addItemToFavourites({
  required String packageId,
  required String bookingTypeId,
  required String startDate,
  String? endDate,
}) async {
  final hasInternet = await _connectivityChecker.hasInternetAccess();

  if (!hasInternet) {
    print("❌ No internet connection.");
    return const Left('No internet');
  }

  final token = await GetSharedPreferences.getAccessToken();
  if (token == null) {
    print('❌ No access token found.');
    return const Left('No access token found.');
  }

  _headers['Authorization'] = 'Bearer $token';

  final uri = Uri.parse('$url/booking');

  var request = http.MultipartRequest('POST', uri);
  request.headers.addAll(_headers);
  request.fields['packageId'] = packageId;
  request.fields['bookingTypeId'] = bookingTypeId;
  request.fields['startDate'] = startDate;
  if (endDate != null) {
    request.fields['endDate'] = endDate;
  }

  print("📤 Sending booking request with data: ${request.fields}");

  final response = await request.send().timeout(
    Duration(seconds: 10),
    onTimeout: () {
      print("⏰ Request timed out.");
      throw TimeoutException('The request timed out.');
    },
  );

  print("📥 Response received with status: ${response.statusCode}");

  if (response.statusCode == 200 || response.statusCode == 201) {
    final responseData = await http.Response.fromStream(response);
    final data = json.decode(responseData.body);
    print("✅ Booking successful: $data");
    final postedItem = PostedFavouritemItemModel.fromJson(data);
    return Right("Success");
  } else if (response.statusCode == 422 || response.statusCode == 404) {
    final responseData = await http.Response.fromStream(response);
    print("⚠️ Booking validation error: ${responseData.body}");

    final data = json.decode(responseData.body);
    if (data is Map<String, dynamic> && data.containsKey('message')) {
      final loginModel = AddBookingValidation.fromJson(data);
      print("⚠️ Parsed AddBookingValidation model: $loginModel");
      return left(loginModel);
    } else {
      print("❌ Unexpected format, not AddBookingValidation.");
      return left('Unexpected error format');
    }
  } else {
    final responseData = await http.Response.fromStream(response);
    print('❌ Request failed with status: ${response.statusCode}, body: ${responseData.body}');
    return Left('Failed to create booking: ${response.statusCode}');
  }
}
}