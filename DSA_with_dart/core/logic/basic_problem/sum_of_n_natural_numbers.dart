int findSum(int n) {
  int sum = 0;
  // iterating over all the numbers
  // between 1 to n
  for (int i = 1; i <= n; i++) {
    sum = sum + i;
  }
  return sum;
}

int main() {
  int n = 9;
  print(findSum(n));
  return 0;
}
