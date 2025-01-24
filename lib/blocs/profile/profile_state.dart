import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final String name;
  final String location;
  final String email;
  final String bio;
  final String? profileImagePath;
  final bool isLoading;
  final String? error;

  const ProfileState({
    this.name = '',
    this.location = '',
    this.email = '',
    this.bio = '',
    this.profileImagePath,
    this.isLoading = false,
    this.error,
  });

  ProfileState copyWith({
    String? name,
    String? location,
    String? email,
    String? bio,
    String? profileImagePath,
    bool? isLoading,
    String? error,
  }) {
    return ProfileState(
      name: name ?? this.name,
      location: location ?? this.location,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [name, location, email, bio, profileImagePath, isLoading, error];
}