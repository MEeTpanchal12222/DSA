bool isEven(int n) {
  // finding remainder of n
  int rem = n % 2;
  if (rem == 0) {
    return true;
  } else {
    return false;
  }
}

int main() {
  int n = 15;
  if (isEven(n))
    print("true");
  else
    print("false");

  return 0;
}
