class Cat {
  final String? _name;
  final String? _url;

  Cat({
    required String name,
    required String url,
  })  : _name = name,
        _url = url;

  String? get getCatName => _name;
  String? get getCatImageUrl => _url;
}
