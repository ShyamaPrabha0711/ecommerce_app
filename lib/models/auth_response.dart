class AuthResponse {
  int? success;
  String? message;
  Customerdata? customerdata;
  String? guestId;

  AuthResponse({this.success, this.message, this.customerdata, this.guestId});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    success: json["success"],
    message: json["message"],
    customerdata: json["customerdata"] == null
        ? null
        : Customerdata.fromJson(json["customerdata"]),
    guestId: json["guest_id"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "customerdata": customerdata?.toJson(),
    "guest_id": guestId,
  };
}

class Customerdata {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? referee;
  String? referralCode;
  int? status;
  String? token;
  int? otpverificationstatus;
  int? emailverificationstatus;

  Customerdata({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.referee,
    this.referralCode,
    this.status,
    this.token,
    this.otpverificationstatus,
    this.emailverificationstatus,
  });

  factory Customerdata.fromJson(Map<String, dynamic> json) => Customerdata(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    referee: json["referee"],
    referralCode: json["referral_code"],
    status: json["status"],
    token: json["token"],
    otpverificationstatus: json["otpverificationstatus"],
    emailverificationstatus: json["emailverificationstatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "referee": referee,
    "referral_code": referralCode,
    "status": status,
    "token": token,
    "otpverificationstatus": otpverificationstatus,
    "emailverificationstatus": emailverificationstatus,
  };
}
