import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/models/shop_model/categories_moodel.dart';
import 'package:i_am_rich/modules/shop_app/categories/Sportes.dart';
import 'package:i_am_rich/modules/shop_app/categories/clothes.dart';
import 'package:i_am_rich/modules/shop_app/categories/electronic_device.dart';
import 'package:i_am_rich/modules/shop_app/categories/lighting.dart';
import 'package:i_am_rich/modules/shop_app/cubit/cubit.dart';
import 'package:i_am_rich/modules/shop_app/cubit/states.dart';
import 'package:i_am_rich/shared/components/components.dart';

import 'prevent_corona.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) => buildCatItem(
              ShopCubit.get(context).categoriesModel!.data!.dataModel[index] , context),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount:
              ShopCubit.get(context).categoriesModel!.data!.dataModel.length,
        );
      },
    );
  }

  Widget buildCatItem(DataCatModel model , context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(model.image!),
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20.0,
            ),
            DefaultTextStyle(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(model.name!),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                if(model.name =='electrionic devices'){
                  ShopCubit.get(context).getElectronicDevices();
                  navigateTo(context, ElectronicDeviceScreen());
                }
                if(model.name =='Prevent Corona'){
                  ShopCubit.get(context).getPreventCorona();
                  navigateTo(context, PreventCoronaScreen());
                }
                if(model.name =='sports'){
                  ShopCubit.get(context).getSports();
                  navigateTo(context, SportScreen());
                }
                if(model.name =='Lighting'){
                  ShopCubit.get(context).getLighting();
                  navigateTo(context, LightingScreen());
                }
                if(model.name =='Clothes'){
                  ShopCubit.get(context).getClothes();
                  navigateTo(context, ClothesScreen());
                }
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
      );
}
