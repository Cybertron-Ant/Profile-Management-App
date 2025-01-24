import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState(
    name: 'John Doe',
    location: '@San Francisco, CA',
    email: 'john.doe@example.com',
    bio: 'Software engineer passionate about building great user experiences. Love to travel and explore new technologies.',
  )) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfileImage>(_onUpdateProfileImage);
    on<UpdateProfileInfo>(_onUpdateProfileInfo);
    on<SaveProfile>(_onSaveProfile);
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    // Here you would typically load profile data from a repository
    // For now, we'll use the initial state
    emit(state);
  }

  void _onUpdateProfileImage(UpdateProfileImage event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      profileImagePath: event.imagePath,
    ));
  }

  void _onUpdateProfileInfo(UpdateProfileInfo event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      name: event.name,
      location: event.location,
      email: event.email,
      bio: event.bio,
    ));
  }

  void _onSaveProfile(SaveProfile event, Emitter<ProfileState> emit) {
    // Here you would typically save the profile to a repository
    emit(state.copyWith(
      name: event.name,
      location: event.location,
      email: event.email,
      bio: event.bio,
    ));
  }
}