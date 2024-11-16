import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/profile/state/profile_cubit.dart';
import 'package:myapp/profile/widgets/app_tab.dart';
import 'package:myapp/profile/widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: Scaffold(
          body: Column(
        children: [
          const ProfileHeader(),
          const SizedBox(height: 80),
          AppTab(options: {'Footprint', 'Collection'}, onTabChanged: (tab) {})
          // Body
        ],
      )),
    );
  }
}
