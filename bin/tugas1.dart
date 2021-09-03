import 'dart:io';


void main(){
  Users user1 = new Users('User1', 10000, 1234);
  Users user2 = new Users('User2', 10000, 12345);
  Users user3 = new Users('User3', 10000, 123456);

  login(user1, user2, user3);
}

class Users{
  late String nama;
  late int saldo;
  late int pin;

  Users(this.nama, this.saldo, this.pin);

  String getName() {
    return nama;
  }

  int getPin() {
    return pin;
  }

  int getSaldo() {
    return saldo;
  }

  setSaldo(int saldo) {
    this.saldo = saldo;
  }
}


login(Users user1,Users user2,Users user3){
  print('\n-----------------------');
  print('Masuk ATM');
  stdout.write('PIN : ');
  int inputPin = int.parse(stdin.readLineSync()!);

  if(inputPin==user1.getPin()){
    homepage(user1, user1, user2, user3);
  }else if (inputPin==user2.getPin()){
    homepage(user2, user1, user2, user3);
  }else if (inputPin==user3.getPin()){
    homepage(user3, user1, user2, user3);
  }else{
    print("Pin salah");
  }
}

homepage(Users userLogin, Users user1, Users user2, Users user3){
  print('\n-----------------------');
  print('Selamat Datang ' + userLogin.getName());

  print('1 = Tarik Tunai');
  print('2 = Setor Tunai');
  print('3 = Cek Saldo');
  print('4 = Transfer');
  print('5 = Menu Utama');
  print('6 = Ganti Akun');
  print('7 = Exit');

  stdout.write('Pilih Menu : ');
  int pilihMenu = int.parse(stdin.readLineSync()!);

  if(pilihMenu == 1){

    print('\nTarik Tunai');
    stdout.write('Nominal : ');

    int tarikTunai = int.parse(stdin.readLineSync()!);
    userLogin.saldo -= tarikTunai;
    int sisa_saldo= userLogin.getSaldo();
    print('Anda menarik uang sebesar Rp.$tarikTunai.');
    print("Sisa saldo anda Rp.$sisa_saldo");
    homepage(userLogin, user1, user2, user3);

  } else if(pilihMenu == 2) {

    print('\nSetor Tunai');
    stdout.write('Nominal : ');

    int setorTunai = int.parse(stdin.readLineSync()!);
    userLogin.saldo += setorTunai;
    homepage(userLogin, user1, user2, user3);

  } else if(pilihMenu == 3) {

    print('\nCek Saldo');
    print(userLogin.getSaldo());
    homepage(userLogin, user1, user2, user3);

  } else if(pilihMenu == 4) {
    print('\nTransfer');
    stdout.write('Masukkan Username Tujuan : ');
    String namaTujuan = stdin.readLineSync()!;
    if(namaTujuan == user1.getName()){
      Transfer(userLogin, user1);
    }else if(namaTujuan == user2.getName()){
      Transfer(userLogin, user2);
    }else if(namaTujuan == user3.getName()){
      Transfer(userLogin, user3);
    }else{
      print("Nama User tidak ada");
    }
    homepage(userLogin, user1, user2, user3);

  } else if(pilihMenu == 5) {

  homepage(userLogin, user1, user2, user3);

  }else if(pilihMenu == 6) {
    login(user1, user2, user3);

  }else if(pilihMenu == 7){
    print('\nTerimakasih telah menggunakan aplikasi kamu');

  }else {

    print('\nMenu yang kamu pilih tidak ada!');

  }
}

Transfer(Users userLogin, Users userTujuan){
  stdout.write('Masukkan Jumlah Uang Yang Ditransfer : ');
  int transfer = int.parse(stdin.readLineSync()!);
  if(transfer<=userLogin.getSaldo()){
    userTujuan.saldo += transfer;
    userLogin.saldo -= transfer;
    print("Sukses Transfer");
  }else{
    print("Saldo di rekening anda tidak cukup");
  }
}


