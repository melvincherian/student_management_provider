recursiveBinarysearch(List<int> arr, int target) {
  return search(arr, target, 0, arr.length - 1); 
}

search(List<int> arr, int target, int leftIndex, int rightIndex) {
  if (leftIndex > rightIndex) {
    return -1;
  }
  int middleIndex = (leftIndex + rightIndex) ~/ 2;
  if (target == arr[middleIndex]) {
    return middleIndex;
  }
  if (target < arr[middleIndex]) {
    return search(arr, target, leftIndex, middleIndex - 1);
  } else {
    return search(arr, target, middleIndex + 1, rightIndex);
  }
}

void main() {
  print(recursiveBinarysearch([-5, 2, 4, 6, 10], 10));
  print(recursiveBinarysearch([-5, 2, 4, 6, 10], 6));
  print(recursiveBinarysearch([-5, 2, 4, 6, 10], 20));
}
//Big O (log n)