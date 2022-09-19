// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/modules/shop_app/cubit/cubit.dart';
import 'package:i_am_rich/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:i_am_rich/shared/cubit/cubit.dart';
import 'package:i_am_rich/shared/cubit/states.dart';
import 'package:i_am_rich/shared/network/local/cache_helper.dart';
import 'package:i_am_rich/shared/network/remote/dio_helper.dart';
import 'package:i_am_rich/shared/styless/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'package:i_am_rich/shared/components/constants.dart';

import 'modules/shop_app/splash/splash_screen.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.get(key: 'isDark');
  Widget? widgets;
  token = CacheHelper.get(key: 'token');
  print(token);
  bool? onBoarding = CacheHelper.get(key: 'onBoarding');
  if(onBoarding !=null)
    {
      widgets = SplashView();
    }else{
    widgets = OnBoardingScreen();
  }

  runApp(MyApp(isDark,widgets));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget? startWidget;
  const MyApp(this.isDark,this.startWidget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>NewsCubit()..getBusiness()),
        BlocProvider(create: (context) =>AppCubit()..changeAppMode(fromShared: isDark)),
        BlocProvider(create: (context) =>ShopCubit()..getHomeData()..getCategories()..getFavorites()..getUserData()),
      ],
      child: BlocConsumer<AppCubit , AppState>(
        listener: (context , state){},
        builder: (context , state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark :ThemeMode.light,
            home:startWidget,
          );
        },
      ),
    );
  }
}
