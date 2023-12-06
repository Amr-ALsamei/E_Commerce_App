class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  String? couponExpiredate;
  int? couponDiscount;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponExpiredate,
      this.couponDiscount});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_Id'];
    couponName = json['coupon_Name'];
    couponCount = json['coupon_Count'];
    couponExpiredate = json['coupon_Expiredate'];
    couponDiscount = json['coupon_Discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_Id'] = this.couponId;
    data['coupon_Name'] = this.couponName;
    data['coupon_Count'] = this.couponCount;
    data['coupon_Expiredate'] = this.couponExpiredate;
    data['coupon_Discount'] = this.couponDiscount;
    return data;
  }
}