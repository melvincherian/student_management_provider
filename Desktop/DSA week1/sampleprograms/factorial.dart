factorial(n){

int res=1;
for(int i=2;i<=n;i++){
  res=res*i;

}
return res;

}
void main(){
  print(factorial(2));
  print(factorial(3));
  print(factorial(4));
}


// Big-0=0(n);