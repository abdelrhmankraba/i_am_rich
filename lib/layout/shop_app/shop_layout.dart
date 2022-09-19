import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/modules/shop_app/search/search_screen.dart';
import 'package:i_am_rich/modules/shop_app/cubit/cubit.dart';
import 'package:i_am_rich/modules/shop_app/cubit/states.dart';
import 'package:i_am_rich/shared/components/components.dart';
import 'package:i_am_rich/shared/styless/colors.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: DefaultTextStyle(
              style: const TextStyle(
                color: colorBottom,
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Shop App'),
                  //TypewriterAnimatedText('Developed by kraba'),
                  //WavyAnimatedText('Shop App developed by kraba'),
                ],
                onTap: (){},
                isRepeatingAnimation: true,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, const SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            height: 45,
            color: const Color(0xFF4C53A5),
            backgroundColor: Colors.white,
            items: [
              const Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              Badge(
                badgeContent: Text(
                  '${ShopCubit.get(context).numCategories}',
                  style: const TextStyle(color: Colors.white),
                ),
                position: BadgePosition.topEnd(),
                animationType: BadgeAnimationType.slide,
                badgeColor: Colors.blue,
                child: const Icon(
                  Icons.apps,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Badge(
                badgeContent: Text(
                  '${ShopCubit.get(context).numFavorites}',
                  style: const TextStyle(color: Colors.white),
                ),
                position: BadgePosition.topEnd(),
                animationType: BadgeAnimationType.slide,
                badgeColor: Colors.blue,
                child: const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const Icon(
                Icons.settings,
                size: 30,
                color: Colors.white,
              ),
            ],
            index: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottom(index);
            },
          ),
        );
      },
    );
  }
}
