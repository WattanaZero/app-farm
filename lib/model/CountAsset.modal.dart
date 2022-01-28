class CountAssetList {
  String? status;
  String? message;
  List<CountAsset>? data;

  CountAssetList({this.status, this.message, this.data});

  CountAssetList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CountAsset>[];
      json['data'].forEach((v) {
        data?.add(new CountAsset.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountAsset {
  int? id;
  int? numberTotoalCount;
  int? totalCount;
  String? costCenter;
  String? creator;
  String? countNumber;
  String? countDate;
  int? normalNumber;
  int? wornOutNumber;
  int? repairNumber;
  String? createBy;
  String? createDate;
  String? updateBy;
  String? updateDate;

  CountAsset({
    this.id,
    this.numberTotoalCount,
    this.totalCount,
    this.costCenter,
    this.creator,
    this.countNumber,
    this.countDate,
    this.normalNumber,
    this.wornOutNumber,
    this.repairNumber,
    this.createBy,
    this.createDate,
    this.updateBy,
    this.updateDate,
  });

  CountAsset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberTotoalCount = json['numberTotoalCount'];
    totalCount = json['totalCount'];
    costCenter = json['costCenter'];
    creator = json['creator'];
    countNumber = json['countNumber'];
    countDate = json['countDate'];
    normalNumber = json['normalNumber'];
    wornOutNumber = json['wornOutNumber'];
    repairNumber = json['repairNumber'];
    createBy = json['createBy'];
    createDate = json['createDate'];
    updateBy = json['updateBy'];
    updateDate = json['updateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['numberTotoalCount'] = this.numberTotoalCount;
    data['totalCount'] = this.totalCount;
    data['costCenter'] = this.costCenter;
    data['creator'] = this.creator;
    data['countNumber'] = this.countNumber;
    data['countDate'] = this.countDate;
    data['normalNumber'] = this.normalNumber;
    data['wornOutNumber'] = this.wornOutNumber;
    data['repairNumber'] = this.repairNumber;
    data['createBy'] = this.createBy;
    data['createDate'] = this.createDate;
    data['updateBy'] = this.updateBy;
    data['updateDate'] = this.updateDate;
    return data;
  }
}
