class FakeLocationInteractor implements LocationInteractor {
  int callLocation = 0;
  @override
  Future<Location> location() async {
    //TODO try catch на сокет exception
    callLocation++;
    return Location(
      lat: "",
      long: "",
    );
  }
}