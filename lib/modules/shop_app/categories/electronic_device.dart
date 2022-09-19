import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/modules/shop_app/cubit/cubit.dart';
import 'package:i_am_rich/modules/shop_app/cubit/states.dart';
import 'package:i_am_rich/shared/components/components.dart';


class ElectronicDeviceScreen extends StatelessWidget {
  const ElectronicDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context , state){},
      builder: (context , state){
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: state is! ShopLoadingCategoryProductsState ,
            builder:(context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context , index) => buildListProduct(ShopCubit.get(context).electronicDeviceModel!.data!.data![index],context),
              separatorBuilder: (context , index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              itemCount: ShopCubit.get(context).electronicDeviceModel!.data!.data!.length,
            ),
            fallback:(context) =>const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }



}
