import 'package:equatable/equatable.dart';

class StreamResponseEntity extends Equatable{
  final String? s;
  final String? p;
  final String? q;
  final String? dc;
  final String? dd;
  final int? t;

  const StreamResponseEntity({this.s, this.p, this.q, this.dc, this.dd, this.t});

  @override
  // TODO: implement props
  List<Object?> get props => [
    s, p, q, dc, dd, t
  ];

}