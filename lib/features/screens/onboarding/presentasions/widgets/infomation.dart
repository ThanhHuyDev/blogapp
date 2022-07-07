import 'package:blogapp/features/screens/onboarding/presentasions/bloc/image_avatar/image_avatar_bloc.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/cubits/cubit/setup_profile_cubit.dart';
import 'package:blogapp/features/screens/settings/presentasions/bloc/export_bloc.dart';
import 'package:blogapp/widgets/image_setup.dart';
import 'package:blogapp/widgets/text_formfied.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../entities/models/user_model.dart';
import '../../../../../services/firebase/storage/storage_repository.dart';
import '../../../../../widgets/button_default.dart';

class Infomation extends StatefulWidget {
  const Infomation({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  State<Infomation> createState() => _InfomationState(tabController);
}

class _InfomationState extends State<Infomation> {
  _InfomationState(this.tabController);
  List gender = ["male", "female"];
  String? selectedGender;
  final TabController tabController;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final statusController = TextEditingController();
  XFile? file;
  ImagePicker? picker;
  Future selectGalery() async {
    picker = ImagePicker();
    final result = await picker?.pickImage(source: ImageSource.gallery);
    if (result == null) return;
    setState(() {
      file = result;
      context.read<ImageAvatarBloc>().add(UpdateImage(file!.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                _buildHeader(context),
                const SizedBox(height: 60),
                _buildUserAvatar(context),
                const SizedBox(height: 40),
                CustomTextFormField(
                  hinttext: 'input your name',
                  labeltext: 'Name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  hinttext: 'input your age',
                  labeltext: 'Age',
                  controller: ageController,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  hinttext: 'input your phone',
                  labeltext: 'Phone',
                  controller: phoneNumberController,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  hinttext: 'input your status',
                  labeltext: 'Status',
                  controller: statusController,
                ),
                const SizedBox(
                  height: 13,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Gender',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(),
                    ),
                    //Use the above widget where you want the radio button
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          addRadioButton(0, 'male', context),
                          addRadioButton(1, 'female', context),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          Column(
            children: [
              const StepProgressIndicator(
                totalSteps: 4,
                currentStep: 3,
                selectedColor: Colors.deepOrange,
                unselectedColor: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonDefault(
                title: 'Continute',
                press: () {
                  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                  final String uid = firebaseAuth.currentUser!.uid;
                  if (file == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No image selected')));
                  }
                  if (file != null) {
                    print('uploading..');
                    StorageRepository().uploadImageAvatar(file!);
                  }
                  final UserApp user = UserApp(
                      id: uid,
                      fullName: nameController.text,
                      age: ageController.text,
                      gender: selectedGender!,
                      phoneNumber: phoneNumberController.text,
                      status: statusController.text,
                      imageAvatar: file!.name,
                      imageUrl: [
                        file!.name,
                      ]);
                  context.read<SetupProfileCubit>().saveUserProfile(user);
                  tabController.animateTo(tabController.index + 1);
                },
              )
            ],
          ),
        ]),
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Profile User',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        // const Icon(Icons.menu),
      ],
    );
  }

  Widget _buildUserAvatar(BuildContext context) {
    return BlocBuilder<ImageAvatarBloc, ImageAvatarState>(
      builder: (context, state) {
        if (state is ImageAvatarLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ImageAvatarLoaded) {
          var imageCount = state.imageAvatar.length;
          return (imageCount > 0)
              ? ImageSetup(
                  imageUrl: state.imageAvatar,
                )
              : ImageSetup(
                  press: () {
                    selectGalery();
                  },
                );
        } else {
          return const Text('some thing swrong!');
        }
      },
    );
  }

  Row addRadioButton(int btnValue, String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio<String>(
          activeColor: Colors.deepOrange,
          value: gender[btnValue],
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 14.0,
              ),
        )
      ],
    );
  }
}
