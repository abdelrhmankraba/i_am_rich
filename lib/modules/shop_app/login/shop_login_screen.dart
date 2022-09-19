import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/layout/shop_app/shop_layout.dart';
import 'package:i_am_rich/modules/shop_app/login/cubit/cubit.dart';
import 'package:i_am_rich/modules/shop_app/login/cubit/states.dart';
import 'package:i_am_rich/modules/shop_app/register/shop_register_screen.dart';
import 'package:i_am_rich/shared/components/components.dart';
import 'package:i_am_rich/shared/components/constants.dart';
import 'package:i_am_rich/shared/network/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {

  const ShopLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status!) {
              showToast(
                text: state.loginModel.message!,
                state: ToastState.SUCCESS,
              );
              CacheHelper.saveData(key: 'token', value: state.loginModel.data!.token).then((value){
                token = state.loginModel.data!.token;
                navigateAndFinish(context, const ShopLayout());
              });
            }
            else {
              showToast(
                text: state.loginModel.message!,
                state: ToastState.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultTextForm(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          onSubmit: (value) {},
                          onChange: (value) {},
                          onTap: () {},
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Email must be not empty';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextForm(
                          controller: passwordController,
                          keyboardType: TextInputType.phone,
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: ShopLoginCubit
                              .get(context)
                              .suffixIcon,
                          suffixPress: () {
                            ShopLoginCubit.get(context).changeSuffixIcon();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          onChange: (value) {},
                          onTap: () {},
                          isPassword: ShopLoginCubit
                              .get(context)
                              .isPassword,
                          validate: (String? value) {
                            if (value!.length < 6) {
                              return 'Password must be not empty';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) =>
                              defaultButton(
                                text: 'login',
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                isUpperCase: true,
                                radius: 10.0,
                              ),
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an Account?',
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(context, const ShopRegisterScreen());
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
