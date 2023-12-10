class FakeAuthPerson {
  AuthPerson authPerson() {
    return AuthPerson(
      email: "fake email",
      password: "fake password",
    );
  }
}