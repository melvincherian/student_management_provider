
class Node {
  int value;
  Node? next;

  Node(this.value);
}


class LinkedList {
  Node? head;

  void add(int value) {
    if (head == null) {
      head = Node(value);
    } else {
      Node current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = Node(value);
    }
  }

  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}


LinkedList arrayToLinkedList(List<int> arr) {
  LinkedList linkedList = LinkedList();
  for (int value in arr) {
    linkedList.add(value);
  }
  return linkedList;
}

void main() {
  List<int> array = [1, 2, 3, 4, 5];
  LinkedList linkedList = arrayToLinkedList(array);
  linkedList.printList();
}
