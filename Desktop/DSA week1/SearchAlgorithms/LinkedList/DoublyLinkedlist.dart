class Node {
  var value;
  Node? prev;
  Node? next;

  Node(this.value);
}

class LinkedList {
  Node? head;
  Node? tail;
  var size = 0;

  void append(value) {
    var node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.prev = tail;
      tail!.next = node;
      tail = node;
    }
    size++;
  }

  removeLast() {
    tail = tail!.prev;
    tail!.next = null;
    size--;
  }

  removeAt(index) {
    if (index < 0 || index >= size) {
      return "invalid index";
    }
    var curr = head;
    if (index == 0) {
      if (size == 1) {
        head = null;
        tail = null;
      } else {
        head = head!.next;
        head!.prev = null;
      }
    } else if (index == size - 1) {
      tail = tail!.prev;
      tail!.next = null;
    } else {
      for (var i = 0; i < index; i++) {
        curr = curr!.next;
      }
      curr!.prev!.next = curr.next;
      curr.next!.prev = curr.prev;
    }
    size--;
    return curr!.value;
  }

  void printList() {
    if (head == null) {
      print("List is empty");
    } else {
      var curr = head;
      var listValue = '';
      while (curr != null) {
        listValue += '${curr.value} ';
        curr = curr.next;
      }
      print(listValue);
    }
  }

  void traverse() {
    var curr = head;
    while (curr != null) {
      print(curr.value);
      curr = curr.next;
    }
  }

  void traverseBack() {
    var curr = tail;
    while (curr != null) {
      print(curr.value);
      curr = curr.prev;
    }
  }
}

void main() {
  var list = LinkedList();
  list.append(10);
  list.append(20);
  list.append(30);
  list.append(40);
  list.printList();
  list.removeAt(3);
  list.printList();
}