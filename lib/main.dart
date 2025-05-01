import 'package:cruise_buddy/UI/Login%20Without/login_withoutan_account.dart';
import 'package:cruise_buddy/UI/Screens/Auth/login_screens.dart';

import 'package:cruise_buddy/UI/Screens/On%20Boarding/onboardingscreen_one.dart';
import 'package:cruise_buddy/UI/Screens/On%20Boarding/onboardingscreen_three.dart';
import 'package:cruise_buddy/UI/Screens/On%20Boarding/onboardingscreen_two.dart';
import 'package:cruise_buddy/UI/Screens/Splash/splash_screen.dart';
import 'package:cruise_buddy/UI/Screens/boat_detail/boat_detail_screen.dart';
import 'package:cruise_buddy/UI/Screens/layout/main_layout/main_layout.dart';
import 'package:cruise_buddy/UI/Screens/misc/booking_requests_screen.dart';
import 'package:cruise_buddy/UI/Screens/misc/notifications_screen.dart';
import 'package:cruise_buddy/core/constants/functions/error/custom_error.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/package_details_adapter/package_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/package_details_box.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/user_details_box.dart';
import 'package:cruise_buddy/core/view_model/addItemToFavourites/add_item_to_favourites_bloc.dart';
import 'package:cruise_buddy/core/view_model/bookMyCruise/book_my_cruise_bloc.dart';
import 'package:cruise_buddy/core/view_model/createBookingByOwner/create_booking_by_owner_bloc.dart';
import 'package:cruise_buddy/core/view_model/getCruiseTypes/get_cruise_types_bloc.dart';
import 'package:cruise_buddy/core/view_model/getFavouritesList/get_favourites_list_bloc.dart';
import 'package:cruise_buddy/core/view_model/getFeaturedBoats/get_featured_boats_bloc.dart';
import 'package:cruise_buddy/core/view_model/getLocationDetails/get_location_details_bloc.dart';
import 'package:cruise_buddy/core/view_model/getSearchCruiseResults/get_seached_cruiseresults_bloc.dart';
import 'package:cruise_buddy/core/view_model/getUserProfile/get_user_profile_bloc.dart';
import 'package:cruise_buddy/core/view_model/listCruiseonLocation/list_cruiseon_location_bloc.dart';
import 'package:cruise_buddy/core/view_model/listOwnerpackages/listowner_packages_bloc.dart';
import 'package:cruise_buddy/core/view_model/login/login_bloc.dart';
import 'package:cruise_buddy/core/view_model/postGoogleId/post_google_bloc.dart';
import 'package:cruise_buddy/core/view_model/regsiter/register_bloc.dart';
import 'package:cruise_buddy/core/view_model/removeItemFromFavourites/remove_item_favourites_bloc.dart';
import 'package:cruise_buddy/core/view_model/seeMyBookingList/see_my_booking_list_bloc.dart';
import 'package:cruise_buddy/core/view_model/todaysbookingcount/todays_booking_count_bloc.dart';
import 'package:cruise_buddy/core/view_model/upcomingbookingscount/upcomg_bookingscount_bloc.dart';
import 'package:cruise_buddy/core/view_model/updateUserProfile/update_user_profile_bloc.dart';
import 'package:cruise_buddy/firebase_options.dart';
import 'package:cruise_buddy/test_folder/api_test.dart';
import 'package:cruise_buddy/test_folder/gpay_tedst.dart';
import 'package:cruise_buddy/test_folder/popup_test.dart';
import 'package:cruise_buddy/test_folder/test_package.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailsDBAdapter());
  Hive.registerAdapter(PackageDetailsDBAdapter());
  userDetailsBox = await Hive.openBox<UserDetailsDB>('userDetailsBox');
  packageDetailsBox = await Hive.openBox<PackageDetailsDB>('packageDetailsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => GetUserProfileBloc(),
        ),
        BlocProvider(
          create: (context) => GetLocationDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => GetFeaturedBoatsBloc(),
        ),
        BlocProvider(
          create: (context) => GetCruiseTypesBloc(),
        ),
        BlocProvider(
          create: (context) => GetFavouritesListBloc(),
        ),
        BlocProvider(
          create: (context) => GetSeachedCruiseresultsBloc(),
        ),
        BlocProvider(
          create: (context) => AddItemToFavouritesBloc(),
        ),
        BlocProvider(
          create: (context) => ListCruiseonLocationBloc(),
        ),
        BlocProvider(
          create: (context) => RemoveItemFavouritesBloc(),
        ),
        BlocProvider(
          create: (context) => PostGoogleBloc(),
        ),
        BlocProvider(
          create: (context) => BookMyCruiseBloc(),
        ),
        BlocProvider(
          create: (context) => SeeMyBookingListBloc(),
        ),
        BlocProvider(
          create: (context) => TodaysBookingCountBloc(),
        ),
        BlocProvider(
          create: (context) => UpcomgBookingscountBloc(),
        ),
        BlocProvider(
          create: (context) => ListownerPackagesBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateUserProfileBloc(),
        ),
        BlocProvider(
          create: (context) => CreateBookingByOwnerBloc(),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return CustomErrorWidget(errorDetails: errorDetails);
          };
          return child!;
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

//---------------------
//--------------
//https://www.youtube.com/watch?v=KfVeYXAtGAM

//----------------------

// SHA1: B6:F4:F2:1B:B3:29:00:7E:CF:0D:F4:E5:A9:34:4A:E6:7B:35:32:D8
// SHA-256: 3B:71:35:56:4E:F4:F1:5A:22:9C:95:57:D6:B2:82:1B:B9:1C:0F:D8:86:16:30:71:69:3A:92:C0:9F:00:4C:0D
