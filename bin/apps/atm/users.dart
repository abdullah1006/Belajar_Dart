class Users {
  late String name;
  late int balance;
  late int pin;

  Users(
    this.name,
    this.balance,
    this.pin,
  );

  String getName() {
    return name;
  }

  int getPin() {
    return pin;
  }

  int getBalance() {
    return balance;
  }

  setBalance(int balance) {
    this.balance = balance;
  }
}

List<Users> userList = [
  Users(
    'User1',
    10000,
    1234,
  ),
  Users(
    'User2',
    10000,
    12345,
  ),
  Users(
    'User3',
    10000,
    123456,
  ),
];
