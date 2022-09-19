import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:i_am_rich/modules/shop_app/cubit/cubit.dart';
import 'package:i_am_rich/modules/shop_app/cubit/states.dart';
import 'package:i_am_rich/modules/shop_app/login/shop_login_screen.dart';
import 'package:i_am_rich/modules/shop_app/update/update_screen.dart';
import 'package:i_am_rich/shared/components/components.dart';
import 'package:i_am_rich/shared/network/local/cache_helper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;

        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Profile Data',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    defaultTextForm(
                      readOnly: true,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      label: 'Name',
                      prefix: Icons.person,
                      onTap: () {},
                      onChange: (value) {},
                      onSubmit: (value) {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'name must be not empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextForm(
                      readOnly: true,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: 'Email',
                      prefix: Icons.email,
                      onTap: () {},
                      onChange: (value) {},
                      onSubmit: (value) {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'email must be not empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextForm(
                      readOnly: true,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      label: 'Phone',
                      prefix: Icons.phone,
                      onTap: () {},
                      onChange: (value) {},
                      onSubmit: (value) {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'phone must be not empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      'Rating App',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    RatingBar(
                      minRating: 1,
                      updateOnDrag: true,
                      maxRating: 5,
                      initialRating: ShopCubit.get(context).checkRating(),
                      allowHalfRating: true,
                      ratingWidget: RatingWidget(
                        full: const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        half: const Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                        empty: const Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                      ),
                      onRatingUpdate: (double value) {
                        CacheHelper.saveData(key: 'rating', value: value);
                        ShopCubit.get(context).changeRating(value);
                        print(ShopCubit.get(context).numOfRating);
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateTo(context, const UpdateScreen());
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              navigateTo(context, const UpdateScreen());
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        CacheHelper.removeData(key: 'token',).then((value){
                          if(value){
                            navigateAndFinish(context, const ShopLoginScreen());
                          }
                        });
                        },
                      child: Row(
                        children: [
                          const Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {

                              navigateAndFinish(
                                  context, const ShopLoginScreen());
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  void _saveRating() {}
}
