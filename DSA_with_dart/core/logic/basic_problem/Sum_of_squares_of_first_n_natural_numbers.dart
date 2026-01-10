int summation(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) sum += (i * i);

  return sum;
}

int main() {
  int n = 2;
  print("Sum of squares of first $n natural numbers is: ${summation(n)}");
  return 0;
}
