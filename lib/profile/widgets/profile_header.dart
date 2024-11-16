import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/extensions/build_context_extensions.dart';
import 'package:myapp/profile/models/user.dart';
import 'package:myapp/profile/state/profile_cubit.dart';

const profileImg = '';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      return switch (state) {
        ProfileStateLoading() =>
          const Center(child: CircularProgressIndicator()),
        ProfileStateFailure() => const Center(child: Icon(Icons.warning)),
        ProfileStateData(user: final u) => _HeaderContent(user: u),
      };
    });
  }
}

class _HeaderContent extends StatelessWidget {
  const _HeaderContent({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ColoredBox(
          color: context.theme.primaryColor,
          child: Stack(
            children: [
              Positioned(
                top: -90,
                right: -70,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(146, 214, 205, 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const SizedBox.square(
                    dimension: 200,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Mine',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          foregroundImage: NetworkImage(user.imageUrl),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              user.highlight,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(219, 240, 239, 1),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 60)
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width - 40,
              height: 80,
              child: Card(
                elevation: 1,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${user.fans}'),
                          Text('Fans'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${user.follows}'),
                          Text('Follow'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${user.reviews}'),
                          Text('Review'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
