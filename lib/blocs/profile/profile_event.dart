import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {}

class UpdateProfileImage extends ProfileEvent {
  final String imagePath;

  const UpdateProfileImage(this.imagePath);

  @override
  List<Object?> get props => [imagePath];
}

class UpdateProfileInfo extends ProfileEvent {
  final String? name;
  final String? location;
  final String? email;
  final String? bio;

  const UpdateProfileInfo({
    this.name,
    this.location,
    this.email,
    this.bio,
  });

  @override
  List<Object?> get props => [name, location, email, bio];
}

class SaveProfile extends ProfileEvent {
  final String name;
  final String location;
  final String email;
  final String bio;

  const SaveProfile({
    required this.name,
    required this.location,
    required this.email,
    required this.bio,
  });

  @override
  List<Object?> get props => [name, location, email, bio];
}