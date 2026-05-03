class Address {
  String addressName;
  String detailAddress;
  Address({
    required this.addressName,
    required this.detailAddress
  });
}
List<Address> address=[
  Address(addressName: "Home Address", detailAddress: "182, Phnom Penh"),
   Address(addressName: "Office Address", detailAddress: "182, Phnom Penh")
];