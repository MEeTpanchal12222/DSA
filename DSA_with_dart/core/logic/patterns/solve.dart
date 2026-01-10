import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  switch (stdin.readLineSync()) {
    case "3":
      pattern3();
      break;
    case "4":
      pattern4();
      break;
    case "5":
      pattern5();
      break;
    case "28":
      pattern28();
      break;
    case "30":
      pattern30();
      break;
    case "17":
      pattern17();
      break;
    case "31":
      pattern31();
      break;
    default:
      print("Invalid input");
  }
}

void pattern31() {
  for (int row = 0; row <= 2 * 5 ; row++) {
    for (int col = 0; col <= 2 * 5 ; col++) {
      int atEveryIndex = 5 -min(min(row,col),min(2*5 - row , 2*5 - col));
      stdout.write("$atEveryIndex ");
    }
    stdout.write("\n");
  }
}
void pattern13() {
  int row = 5; // Changed to 5
  int col = 2 * row - 1;

  for (int i = 0; i < row; i++) {
    String space = '';
    for (int j = 0; j < col; j++) {
      // Logic to draw only the outline
      if (i == row - 1 || j == row - 1 - i || j == row - 1 + i) {
        space += '*';

        
      } else {
        space += ' ';
      }
    }
    print(space);
  }
}



void pattern17() {
  for (int row = 1; row <= 2 * 5; row++) {
    int c = row > 5 ? 2 * 5 - row : row;
    for (int space = 0; space < 5 - c; space++) {
      stdout.write('  ');
    }
    for (int col = c; col >= 1; col--) {
      stdout.write('$col' + ' ');
    }
    for (int col = 2; col <= c; col++) {
      stdout.write('$col' + ' ');
    }
    stdout.write('\n');
  }
}

void pattern30() {
  for (int row = 1; row <= 5; row++) {
    for (int space = 0; space < 5 - row; space++) {
      stdout.write('  ');
    }
    for (int col = row; col >= 1; col--) {
      stdout.write('$col' + ' ');
    }
    for (int col = 2; col <= row; col++) {
      stdout.write('$col' + ' ');
    }
    stdout.write('\n');
  }
}

void pattern28() {
  for (int row = 0; row < 2 * 5; row++) {
    int totalcolinRow = row > 5 ? 2 * 5 - row : row;

    int noOfSpaces = 5 - totalcolinRow;
    for (int s = 0; s < noOfSpaces; s++) {
      stdout.write(" ");
    }

    for (int col = 0; col < totalcolinRow; col++) {
      stdout.write("* ");
    }
    stdout.write("\n");
  }
}

void pattern5() {
  for (int row = 0; row < 2 * 5; row++) {
    int c = row > 5 ? 2 * 5 - row : row;
    for (int col = 0; col < c; col++) {
      stdout.write("* ");
    }
    print("\n");
  }
}

void pattern3() {
  for (int i = 5; i > 0; i--) {
    for (int j = i; j > 0; j--) {
      stdout.write(" * ");
    }
    print("\n");
  }
}

void pattern4() {
  for (int row = 1; row <= 5; row++) {
    for (int col = 1; col <= row; col++) {
      stdout.write(" $col ");
    }
    print("\n");
  }
}
