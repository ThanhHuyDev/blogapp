import 'package:blogapp/features/screens/onboarding/presentasions/cubits/cubit/setup_profile_cubit.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/cubits/signup/signup_cubit.dart';
import 'package:blogapp/features/screens/settings/presentasions/bloc/export_bloc.dart';
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
                  final UserApp user = UserApp(
                      id: uid,
                      fullName: nameController.text,
                      age: ageController.text,
                      gender: selectedGender!,
                      phoneNumber: phoneNumberController.text,
                      status: statusController.text,
                      imageAvatar:
                          'https://scontent.fdad3-1.fna.fbcdn.net/v/t39.30808-6/286899290_164446899384811_3295116398456047817_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=75dC8yp19TYAX_smRR8&_nc_oc=AQkh_0y426rctfLfEZPTo2Y4Fbzgnxd8u54G3wfA3I6-50dIW3jxYSFrIwfdwFuAu3AL_v0Ad2hOPxvhIaewB50Z&_nc_ht=scontent.fdad3-1.fna&oh=00_AT9EHD8i2CjK3bpsyEpihGdMYXWbrCNna5oTVwErRdi6vw&oe=62CC3D2D',
                      imageUrl: ['']);
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

  Row _buildUserAvatar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://scontent.fdad3-4.fna.fbcdn.net/v/t39.30808-6/272661431_1107969983372040_196971888314167653_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=0DpHYfySoxwAX9x7Lbs&_nc_oc=AQmToV6EhREQx3Cx6moZPRozxBPFn7VcNlC3-M4UKjuHxhtay8tYRAvOcAoHEEHtN3soE_Ks9ARAQ5yvyCOFMKBN&_nc_ht=scontent.fdad3-4.fna&oh=00_AT9aZRj_XmRtj_MGAv80sbivNrJ7Xc-GHLu1BmxBZRyMlw&oe=62CAFCAD'),
            ),
            Positioned(
              bottom: -4,
              right: -4,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2.5,
                    color: Colors.white,
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepPurple,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () async {
                      ImagePicker? _picker = ImagePicker();
                      final XFile? _image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (_image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No image selected')));
                      }
                      if (_image != null) {
                        print('uploading..');
                        StorageRepository().uploadImage(_image);
                      }
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
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
