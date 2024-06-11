 binarySearch(arr ,target){

int leftIndex=0;
int rightIndex=arr.length-1;

while(leftIndex<=rightIndex){
  int middleIndex=(leftIndex+rightIndex)~/2;

  if(target==arr[middleIndex]){
    return middleIndex;
  }
  if(target<arr[middleIndex]){
    rightIndex=middleIndex-1;
  }
  else{
    leftIndex =middleIndex+1;
  }
}
return -1;
}

void main(){
  print(binarySearch([-5,2,4,6],10));
  print(binarySearch([-5,2,4,6,101],6));
}