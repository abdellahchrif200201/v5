import 'package:devti_agro/core/OnBorarding/onboarding_page.dart';
import 'package:devti_agro/core/config/theme/bloc/theme_bloc.dart';
import 'package:devti_agro/core/config/theme/bloc/theme_event.dart';
import 'package:devti_agro/core/config/theme/bloc/theme_state.dart';
// import 'package:devti_agro/core/config/theme/theme.dart';
import 'package:devti_agro/core/splashScreen/splash_screen.dart';
import 'package:devti_agro/features/Checklist/application/bloc/check_list_bloc.dart';
import 'package:devti_agro/features/Etiquetage/aplication/bloc/etiquetage_bloc.dart';
import 'package:devti_agro/features/Tracbalite/application/bloc/tracabilte_bloc.dart';
import 'package:devti_agro/features/auth/login/aplication/bloc/login_bloc.dart';
import 'package:devti_agro/features/auth/register/application/bloc/register_bloc.dart';
import 'package:devti_agro/features/chambre/application/bloc/create_chambre_bloc/add_chambre_bloc.dart';
import 'package:devti_agro/features/dashboard/HomePage.dart';
import 'package:devti_agro/features/nutrition/application/bloc/nutrition_bloc.dart';
import 'package:devti_agro/features/overview/aplication/bloc/tasks_bloc.dart';
import 'package:devti_agro/features/permission/aplication/bloc/add_role_bloc/bloc/permission_bloc.dart';
import 'package:devti_agro/features/role/aplication/bloc/add_role_bloc/bloc/role_bloc.dart';
import 'package:devti_agro/features/user/aplication/bloc/add_role_bloc/bloc/user_bloc.dart';
import 'package:devti_agro/features/zone/aplication/bloc/zone/bloc/zone_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/chambre/application/bloc/get_chambres_bloc/chambres_bloc.dart';
import 'injection_conatiner.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? name;
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ChambresBloc>()..add(GetAllChambresEvent())),
        BlocProvider(create: (_) => di.sl<TasksBloc>()..add(GetAllTasksEvent())),
        BlocProvider(create: (_) => di.sl<EtiquetageBloc>()..add(GetAllEtiquetageEvent())),
        BlocProvider(create: (_) => di.sl<TracabilteBloc>()..add(GetAllTracabiliteEvent())),
        BlocProvider(create: (_) => di.sl<NutritionBloc>()..add(GetAllNutritionEvent())),
        BlocProvider(create: (_) => di.sl<CheckListBloc>()..add(GetAllCheckListEvent())),
        BlocProvider(create: (_) => di.sl<ZoneBloc>()..add(const GetAllZoneEvent(idEntreprise: 1))),
        BlocProvider(create: (_) => di.sl<RoleBloc>()..add(GetAllRoleEvent())),
        BlocProvider(create: (_) => di.sl<UserBloc>()..add(GetAllUserEvent())),
        BlocProvider(create: (_) => di.sl<PermissionBloc>()..add(GetAllPermissionEvent())),
        BlocProvider(create: (_) => di.sl<ThemeBloc>()..add(LoadThemeSettings())),
        BlocProvider(create: (_) => di.sl<LoginBloc>()),
        BlocProvider(create: (_) => di.sl<RegisterBloc>()),
        BlocProvider(create: (_) => di.sl<AddChambreBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // Adjust this to your design's dimensions
        builder: (context, child) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: name == null ? const OnBoardingPage() : const Homepage(),
                theme: state.themeData, // Applying the theme from ThemeBloc state
              );
            },
          );
        },
      ),
    );
  }
}

// import 'package:devti_agro/core/config/theme/bloc/theme_bloc.dart';
// import 'package:devti_agro/core/config/theme/theme.dart';
// import 'package:devti_agro/core/router/router.dart';
// import 'package:devti_agro/core/router/routes.dart';
// import 'package:devti_agro/core/utils/token_utils.dart';
// import 'package:devti_agro/features/Checklist/presontation/bloc/check_list_bloc.dart';
// import 'package:devti_agro/features/Etiquetage/presontation/bloc/etiquetage_bloc.dart';
// import 'package:devti_agro/features/Tracbalite/presentaion/bloc/tracabilte_bloc.dart';
// import 'package:devti_agro/features/auth/login/aplication/bloc/login_bloc.dart';
// import 'package:devti_agro/features/auth/register/presontaion/bloc/register_bloc.dart';
// import 'package:devti_agro/features/chambre/presontaion/bloc/create_chambre_bloc/add_chambre_bloc.dart';
// import 'package:devti_agro/features/nutrition/presentaion/bloc/nutrition_bloc.dart';
// import 'package:devti_agro/features/overview/presontaion/bloc/tasks_bloc.dart';
// import 'package:devti_agro/features/role/aplication/bloc/add_role_bloc/bloc/role_bloc.dart';
// import 'package:devti_agro/features/zone/aplication/bloc/zone/bloc/zone_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'features/chambre/presontaion/bloc/get_chambres_bloc/chambres_bloc.dart';
// import 'injection_conatiner.dart' as di;
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await di.init();

//   // Load the saved theme preference from SharedPreferences
//   final prefs = await SharedPreferences.getInstance();
//   final isDark = prefs.getBool('isDark') ?? false;

//   bool isTokenAvailable = await isTokenPresent();
//   String initialRoute = isTokenAvailable ? AppRoutes.homePage : AppRoutes.login;

//   runApp(MyApp(initialRoute: initialRoute, isDarkMode: isDark));
// }

// class MyApp extends StatelessWidget {
//   final String initialRoute;
//   // final bool isDarkMode;

//   MyApp({required this.initialRoute});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => di.sl<ChambresBloc>()..add(GetAllChambresEvent())),
//         BlocProvider(create: (_) => di.sl<TasksBloc>()..add(GetAllTasksEvent())),
//         BlocProvider(create: (_) => di.sl<EtiquetageBloc>()..add(GetAllEtiquetageEvent())),
//         BlocProvider(create: (_) => di.sl<TracabilteBloc>()..add(GetAllTracabiliteEvent())),
//         BlocProvider(create: (_) => di.sl<NutritionBloc>()..add(GetAllNutritionEvent())),
//         BlocProvider(create: (_) => di.sl<CheckListBloc>()..add(GetAllCheckListEvent())),
//         BlocProvider(create: (_) => di.sl<ZoneBloc>()..add(GetAllZoneEvent(idEntreprise: 1))),
//         BlocProvider(create: (_) => di.sl<RoleBloc>()..add(GetAllRoleEvent())),
//         BlocProvider(create: (_) => di.sl<LoginBloc>()),
//         BlocProvider(create: (_) => di.sl<RegisterBloc>()),
//         BlocProvider(create: (_) => di.sl<AddChambreBloc>()),
//       ],
//       child: ScreenUtilInit(
//         designSize: const Size(375, 812), // Adjust this to your design's dimensions
//         builder: (context, child) {
//           return BlocProvider<ThemeBloc>(
//             create: (context) => ThemeBloc(isDarkMode),
//             child: BlocBuilder<ThemeBloc, ThemeMode>(
//               builder: (context, themeMode) {
//                 return MaterialApp.router(
//                   debugShowCheckedModeBanner: false,
//                   routerConfig: appRouter(initialRoute),
//                   theme: createTheme(context),
//                   darkTheme: createTheme(context),
//                   themeMode: themeMode,
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
