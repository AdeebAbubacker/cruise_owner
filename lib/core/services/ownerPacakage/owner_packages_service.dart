import 'dart:convert';
import 'package:cruise_buddy/core/constants/functions/connection/connectivity_checker.dart';
import 'package:cruise_buddy/core/db/shared/shared_prefernce.dart';
import 'package:cruise_buddy/core/model/list_my_cruise_model/list_my_cruise_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class OwnerPackagesService {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  final String url = 'https://cruisebuddy.in/api/v1';

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'CRUISE_AUTH_KEY': '29B37-89DFC5E37A525891-FE788E23',
  };

Future<Either<String, List<ListMyCruiseModel>>> getOwnerspackages() async {
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

    _headers['Authorization'] = 'Bearer $token';

    final response = await http.get(
      Uri.parse('$url/owner/my/package-list?include=owner.cruises.packages,owner.cruises.cruisesImages'),
      headers: _headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> jsonList = json.decode(response.body);
      final List<ListMyCruiseModel> modelList = jsonList
          .map((item) => ListMyCruiseModel.fromJson(item as Map<String, dynamic>))
          .toList();
            print('gggg');
      return Right(modelList);
    } else {
      print('Request failed: ${response.body.toLowerCase()}');
      return Left('Failed to get cruise type: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
    return Left('Error: $e');
  }
}
}
