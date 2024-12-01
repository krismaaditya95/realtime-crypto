class StreamResponseModel {
  String? s;
  String? p;
  String? q;
  String? dc;
  String? dd;
  int? t;

  StreamResponseModel({this.s, this.p, this.q, this.dc, this.dd, this.t});

  factory StreamResponseModel.fromJson(Map<String, dynamic> json) =>
    StreamResponseModel(
      s: json['s'],
      p: json['p'],
      q: json['q'],
      dc: json['dc'],
      dd: json['dd'],
      t: json['t'],
    );

  Map<String, dynamic> toJson() => {
    "s" : s,
    'p' : p,
    'q' : q,
    'dc': dc,
    'dd': dd,
    't' : t,
  };

}