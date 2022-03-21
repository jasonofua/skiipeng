class User {
  final String userId,
      firstName,
      lastName,
      email,
      dateCreated,
      imageUrl,
      phoneNumber,
      dateOfBirth;
  User(
      this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.dateCreated,
      this.imageUrl,
      this.phoneNumber,
      this.dateOfBirth);

  Map toJson() => {
        'uid': userId,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'dateCreated': dateCreated,
        'imageUrl': imageUrl,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth
      };

  factory User.fromJson(dynamic json) {
    return User(
        json['uid'] as String,
        json['firstName'] as String,
        json['lastName'] as String,
        json['email'] as String,
        json['dateCreated'] as String,
        json['imageUrl'] as String,
        json['phoneNumber'] as String,
        json['dateOfBirth'] as String,

    );
  }
}
