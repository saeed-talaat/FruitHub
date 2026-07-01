class ShippingAddressEntity {
  final String fullName;
  final String email;
  final String address;
  final String phoneNumber;
  final String city;
  final String addressDetails;

  ShippingAddressEntity({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.city,
    required this.address,
    required this.addressDetails,
  });
}
