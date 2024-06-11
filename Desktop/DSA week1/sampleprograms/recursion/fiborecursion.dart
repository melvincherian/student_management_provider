recursiveFibonnocci(n){

if(n<2){
  return n;
}

return recursiveFibonnocci(n-1)+recursiveFibonnocci(n-2);
}
void main(){

print(recursiveFibonnocci(0));
print(recursiveFibonnocci(2));
print(recursiveFibonnocci(6));

}
