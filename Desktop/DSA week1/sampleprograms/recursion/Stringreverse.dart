String reverseString(String str) {
  if (str.isEmpty) {
    return str;
  } else {
    return reverseString(str.substring(1)) + str[0];
  }
}

void main() {
  print(reverseString("Melvin"));
}