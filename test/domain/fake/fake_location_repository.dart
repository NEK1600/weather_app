class FakeLocationRepository implements LocationRepository {
  int callLocation = 0;
  @override
  Future<Location> location() {
    callLocation++;
    return Location(
      lat: "",
      long: "",
    );
  }
}
