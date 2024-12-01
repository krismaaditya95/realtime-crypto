
class StreamRequest{
  String? action;
  String? symbols;
  void Function(dynamic)? onData;

  StreamRequest({
    this.action,
    this.symbols,
    this.onData
  });
}