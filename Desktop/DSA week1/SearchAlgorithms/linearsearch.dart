linearSearch(arr,target){

for(int i=0;i<arr.length;i++){
  if(arr[i]==target){
    return i;
  }
}
return -1;
}
void main(){
  print(linearSearch([5,4,3,2,1],10));
  print(linearSearch([5,4,3,2,10],3));
  print(linearSearch([5,4,3,2,10],20));
}