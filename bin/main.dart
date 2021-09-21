import 'dart:io';
import 'apps/atm/atm.dart';
import 'apps/palindrome.dart';

void main() {
  int chooseMenu;
  do {
    print('\n-------Pilih Aplikasi--------');
    print('1 = Check Palindrom');
    print('2 = Aplikasi ATM');
    print('3 = Exit');

    stdout.write('Pilih Menu : ');
    chooseMenu = int.parse(stdin.readLineSync()!);

    switch (chooseMenu) {
      case 1:
        stdout.write('Masukkan Kata Untuk Di Check : ');
        String inputWords = stdin.readLineSync()!;
        isPalindrom(inputWords)
            ? print('Kata yang anda masukkan termasuk palindrom')
            : print('Kata yang anda masukkan bukan termasuk palindrom');
        break;

      case 2:
        ATM();
        break;
      case 3:
        print('Terimakasih');
        break;

      default:
        print('Pilihan tidak ada');
        break;
    }
  } while (chooseMenu != 3);
}
