import 'dart:io';

///reuseable menu function that has list of choice that user can choose
int? menu() {
  int choice;
  //for decoration purpose
  final String reset = '\x1B[0m'; // Reset all styles
  // final String red = '\x1B[31m'; // Red text
  // final String green = '\x1B[32m'; // Green text
  final String blue = '\x1B[34m'; // Blue text
  final String yellow = '\x1B[33m'; // Yellow text
  // const String orange = '\x1B[38;5;214m'; // Orange text
  const String lightBlue = '\x1B[38;5;117m'; // Light blue text
  print('''
${blue} _ __ ___   ___ _ __  _   _ ${reset}
${blue}| '_ ` _ \\ / _ \\ '_ \\| | | |${reset}
${blue}| | | | | |  __/ | | | |_| |${reset}
${blue}|_| |_| |_|\\___|_| |_|\\__,_|${reset}
''');

  print("${lightBlue}1. Check Balance${reset}");
  print("${lightBlue}2. Withdraw${reset}");
  print("${lightBlue}3. Deposit${reset}");
  print("${lightBlue}0. Exit${reset}");
  print("${yellow}your choice: ${reset}");
  choice = int.parse(stdin.readLineSync()!);
  return choice;
}
