class User {
  final String userId,
      name,
      email,
      dateCreated,
      imageUrl,
      about,
      bankNumber,
      bankName,
      accountNumber;
  final double walletBalance;
  final int totalSales,totalListing;
  User(
      this.userId,
      this.name,
      this.email,
      this.dateCreated,
      this.walletBalance,
      this.imageUrl,
      this.about,
      this.accountNumber,
      this.bankName,
      this.bankNumber,
      this.totalSales,
      this.totalListing);

  Map toJson() => {
        'uid': userId,
        'name': name,
        'email': email,
        'dateCreated': dateCreated,
        'walletBalance': walletBalance,
        'imageUrl': imageUrl,
        'about': about,
        'accountNumber': accountNumber,
        'bankName': bankName,
        'bankNumber': bankNumber,
        'totalSales':totalSales,
        'totalListing':totalListing
      };

  factory User.fromJson(dynamic json) {
    return User(
        json['uid'] as String,
        json['name'] as String,
        json['email'] as String,
        json['dateCreated'] as String,
        json['walletBalance'] as double,
        json['imageUrl'] as String,
        json['about'] as String,
        json['accountNumber'] as String,
        json['bankName'] as String,
        json['bankNumber'] as String,
        json['totalSales'] as int,
        json['totalListing'] as int
    );
  }
}
