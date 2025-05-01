import 'dart:async';
import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/favourites_list_model/favourites_list_model.dart';
import 'package:cruise_buddy/core/model/posted_favouritem_item_model/posted_favouritem_item_model.dart';
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

  Future<Either<String, String>> addItemToFavourites({
    required String packageId,
    required String bookingTypeId,
    required String startDate,
    String? endDate,
  }) async {
    try {
      final hasInternet = await _connectivityChecker.hasInternetAccess();

      if (!hasInternet) {
        print("No internet");
        return const Left('No internet');
      }

      final token = await GetSharedPreferences.getAccessToken();
      if (token == null) {
        print('No access token found.');
        return const Left('No access token found.');
      }

      // Add headers
      _headers['Authorization'] = 'Bearer $token';

      // Build URL
      final uri = Uri.parse('$url/booking');

      // Create request body as form data
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(_headers);
      request.fields['packageId'] = packageId;
      request.fields['bookingTypeId'] = bookingTypeId;
      request.fields['startDate'] = startDate;
      if (endDate != null) {
        request.fields['endDate'] = endDate;
      }

      // Send the request
      final response = await request.send().timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('The request timed out.');
        },
      );

      // Check for response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = await http.Response.fromStream(response);
        final data = json.decode(responseData.body);
        final postedItem = PostedFavouritemItemModel.fromJson(data);
        return Right("Success");
      } else {
        final responseData = await http.Response.fromStream(response);
        print('Request failed with status:  ${responseData.body}');
        return Left('Failed to create booking: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      return Left('Error: $e');
    }
  }
}
