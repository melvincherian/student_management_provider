fibonnocci(n){

List<int>arr=[0,1];

for(int i=2;i<n;i++){
 arr.add(arr[i-1] +arr[i-2]);

}
 return arr;
}
void main(){
  print(fibonnocci(2));
  print(fibonnocci(3));
  print(fibonnocci(7));
}

//Big O O(n) 
