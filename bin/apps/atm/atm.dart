import 'dart:io';
import 'users.dart';

late int usrLogin;
late int usrTf;

void ATM() {
  login();
  homePage();
}

void homePage() {
  int chooseMenu;
  print('Selamat Datang ' + userList[usrLogin].getName());
  do {
    print('\n-------Menu Utama--------');
    print('1 = Tarik Tunai');
    print('2 = Setor Tunai');
    print('3 = Cek Saldo');
    print('4 = Transfer');
    print('5 = Ganti Akun');
    print('6 = Exit ATM');

    stdout.write('Pilih Menu : ');
    chooseMenu = int.parse(stdin.readLineSync()!);

    switch (chooseMenu) {
      case 1:
        grabMoney();
        break;
      case 2:
        deposite();
        break;
      case 3:
        balanceCheck();
        break;
      case 4:
        transfer();
        break;
      case 5:
        login();
        break;
      case 6:
        print('Terimakasih Telah Menggunakan ATM');
        break;
      default:
        print('Pilihan Anda Tidak Ada\n');
        break;
    }
  } while (chooseMenu != 6);
}

void deposite() {
  print('\nSetor Tunai');
  stdout.write('Nominal : ');
  int cashDeposite = int.parse(stdin.readLineSync()!);
  userList[usrLogin].balance += cashDeposite;
  print('Berhasil Setor\n');
}

void balanceCheck() {
  print("Sisa saldo anda Rp.${userList[usrLogin].getBalance()}\n");
}

void transfer() {
  print('\nTransfer');
  stdout.write('Masukkan Username Tujuan : ');
  String namaTujuan = stdin.readLineSync()!;
  if (namaTujuan != userList[usrLogin].name) {
    checkUserTransfer(namaTujuan)
        ? processTransfer()
        : print(
            'User tidak ada\n',
          );
  } else {
    print('Tidak Bisa Mengirim Ke Rekening Sendiri\n'
        'Coba Setor Tunai Saja');
  }
}

void processTransfer() {
  stdout.write('Masukkan Jumlah Uang Yang Ditransfer : ');
  int transfer = int.parse(stdin.readLineSync()!);
  if (transfer <= userList[usrLogin].getBalance()) {
    userList[usrTf].balance += transfer;
    userList[usrLogin].balance -= transfer;
    print("Sukses Transfer");
  } else {
    print("Saldo di rekening anda tidak cukup");
  }
}

bool checkUserTransfer(String userTF) {
  for (int i = 0; i < userList.length; i++) {
    if (userTF == userList[i].name) {
      usrTf = i;
      return true;
    }
  }
  return false;
}

void grabMoney() {
  print('\nTarik Tunai');
  stdout.write('Nominal : ');

  int cashWithdrawal = int.parse(stdin.readLineSync()!);
  userList[usrLogin].balance -= cashWithdrawal;
  print('Anda menarik uang sebesar Rp.$cashWithdrawal.');
  print("Sisa saldo anda Rp.${userList[usrLogin].getBalance()}\n");
}

login() {
  bool isLogin = false;

  print('\n-----------------------');
  print('Masuk ATM');
  do {
    stdout.write('PIN : ');
    int inputPin = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < userList.length; i++) {
      if (inputPin == userList[i].pin) {
        usrLogin = i;
        isLogin = true;
        break;
      }
    }
    isLogin
        ? () {}
        : print('Pin Anda Salah\n'
            'Masukkan Pin Lagi\n');
  } while (isLogin == false);
}
