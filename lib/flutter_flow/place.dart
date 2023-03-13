class FFPlace {
  const FFPlace({
    this.name = '',
    this.address = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.zipCode = '',
  });

  final String name;
  final String address;
  final String city;
  final String state;
  final String country;
  final String zipCode;

  @override
  String toString() => '''FFPlace(
        
        name: $name,
        address: $address,
        city: $city,
        state: $state,
        country: $country,
        zipCode: $zipCode,
      )''';

  @override
  @override
  bool operator ==(other) =>
      other is FFPlace &&
      name == other.name &&
      address == other.address &&
      city == other.city &&
      state == other.state &&
      country == other.country &&
      zipCode == other.zipCode;
}
