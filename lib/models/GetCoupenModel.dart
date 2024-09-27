class CoupenModel {
  int? id;
  String? code;
  String? amount;
  String? status;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? discountType;
    int? usageCount;
  bool? individualUse;
  int? usageLimit;
  int? usageLimitPerUser;
  bool? freeShipping;

  CoupenModel(
      {this.id,
      this.code,
      this.amount,
      this.status,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.discountType,this.usageCount,
      this.individualUse,
      this.usageLimit,
      this.usageLimitPerUser,
      this.freeShipping});

  CoupenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    amount = json['amount'];
    status = json['status'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    discountType = json['discount_type'];
     usageCount = json['usage_count'];
    individualUse = json['individual_use'];
    usageLimit = (json['usage_limit']??0);
    usageLimitPerUser = (json['usage_limit_per_user']??0);
    freeShipping = json['free_shipping'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['discount_type'] = this.discountType;
     data['usage_count'] = this.usageCount;
    data['individual_use'] = this.individualUse;
    data['usage_limit'] = this.usageLimit;
    data['usage_limit_per_user'] = this.usageLimitPerUser;
    data['free_shipping'] = this.freeShipping;
    return data;
  }
}
