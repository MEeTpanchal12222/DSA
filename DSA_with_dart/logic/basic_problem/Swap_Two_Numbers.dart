// int main(){
//     int a = 5, b = 10;
//     print("Before swapping: a = $a, b = $b");

//     // Swapping logic
//     int temp = a;
//     a = b;
//     b = temp;

//     print("After swapping: a = $a, b = $b");
//     return 0;
// }

int main() {
  int a = 2, b = 3;
  print("a = $a, b = $b");

  swap(a, b);

  print("a = $a, b = $b");
  return 0;
}

void swap(int a, int b){
  a = a + b;
  b = a - b;
  a = a - b;
  print("After swapping: a = $a, b = $b");
}
