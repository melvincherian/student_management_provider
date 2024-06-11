recursiveFactorial(n){

if(n==0){
  return 1;
}
return n* recursiveFactorial(n-1);


}
void main(){
  print(recursiveFactorial(0));
  print(recursiveFactorial(2));
  print(recursiveFactorial(5));
}
//Big O O(n)



// int factorial(int n) {
//   // Base case
//   if (n == 0) {
//     return 1;
//   } else {
//     // Recursive case
//     return n * factorial(n - 1);
//   }
// }

// void main() {
//   // Example usage
//   int num = 5;
//   int result = factorial(num);
//   print("Factorial of $num is $result"); // Output: Factorial of 5 is 120
// }
