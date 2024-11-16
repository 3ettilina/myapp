import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/repository/shop_repo.dart';
import 'package:myapp/profile/models/user.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    ShopRepo? shopRepository,
  })  : _repository = shopRepository ?? ShopRepo(),
        super(const ProfileStateLoading()) {
    getProfileDetails();
  }

  final ShopRepo _repository;

  Future<void> getProfileDetails() async {
    try {
      final user = await _repository.getUser();
      emit(
        ProfileStateData(user: user),
      );
    } catch (e) {
      emit(
        const ProfileStateFailure(
          errorMessage:
              'Something went wrong while fetching profile. Please try again!',
        ),
      );
    }
  }
}
