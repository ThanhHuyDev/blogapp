import 'package:blogapp/features/screens/settings/presentasions/bloc/export_bloc.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = '/setting';

  const SettingScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const SettingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: BlocBuilder<SwitchBloc, SwitchState>(
      builder: (context, state) {
        return Switch(
          value: state.switchValue,
          onChanged: (newValue) {
            newValue
                ? context.read<SwitchBloc>().add(SwitchOnEvent())
                : context.read<SwitchBloc>().add(SwitchOffEvent());
          },
        );
      },
    )));
  }
}
