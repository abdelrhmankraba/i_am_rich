import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/modules/shop_app/cubit/cubit.dart';
import 'package:i_am_rich/modules/shop_app/cubit/states.dart';
import 'package:i_am_rich/shared/components/components.dart';
import 'package:i_am_rich/shared/styless/colors.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if(state is ShopSuccessUpdateUserState)
          {
            if(ShopCubit.get(context).userModel != null) {
              showToast(text: ShopCubit.get(context).userModel!.message.toString(), state: ToastState.SUCCESS);
              Navigator.pop(context);
            }
          }
      },
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;

        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: ShopCubit.get(context).userModel != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      if(state is ShopLoadingUpdateUserState)
                        const LinearProgressIndicator(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextForm(
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
                      defaultButton(
                        radius: 5.0,
                        text: 'update',
                        background: colorBottom,
                        function: () {
                          if(formKey.currentState!.validate()){
                            ShopCubit.get(context).updateUserData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) =>
            const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
