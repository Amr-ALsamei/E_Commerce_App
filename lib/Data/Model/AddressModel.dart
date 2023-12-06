class AddressModel {
  int? addressID;
  String? addressName;
  int? addressUserId;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  AddressModel(
      {this.addressID,
      this.addressName,
      this.addressUserId,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressID = json['Address_ID'];
    addressName = json['Address_Name'];
    addressUserId = json['Address_userId'];
    addressCity = json['Address_city'];
    addressStreet = json['Address_street'];
    addressLat = json['Address_lat'];
    addressLong = json['Address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Address_ID'] = this.addressID;
    data['Address_Name'] = this.addressName;
    data['Address_userId'] = this.addressUserId;
    data['Address_city'] = this.addressCity;
    data['Address_street'] = this.addressStreet;
    data['Address_lat'] = this.addressLat;
    data['Address_long'] = this.addressLong;
    return data;
  }
}