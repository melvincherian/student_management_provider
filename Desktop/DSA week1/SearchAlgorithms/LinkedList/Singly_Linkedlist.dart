class Node {
  late int value;
  Node? next;

  Node(this.value);
}

class LinkedList {
  Node? head;
  Node? tail;
  int size = 0;

//<<<<<<<<<<.......Append.......>>>>>>>>>>

  append(int value) {
    final node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      tail?.next = node;
      tail = node;
    }
    size++;
  }
 
//<<<<<<<<<<.......Preppend.......>>>>>>>>>>

  preppend(int Value) {
    final node = Node(Value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.next = head;
      head = node;
    }
    size++;
  }

//<<<<<<<<<<.......Insert.......>>>>>>>>>>

  insert(int index, int value) {
    if (index < 0 || index > size) {
      print('Invalid index');
      return;
    }

    Node newNode = Node(value);
    if (index == 0) {
      newNode.next = head;
      head = newNode;
      if (tail == null) tail = newNode;
    } 
    else {
      Node? current = head;
      for (int i = 0; i < index - 1; i++)

       current = current?.next;
      newNode.next = current!.next;
      current.next = newNode;
      if (index == size) tail = newNode;
    }
    size++;
  }

//<<<<<<<<<<.......Reverse.......>>>>>>>>>>

  reverse() {
    var curr = head;
    var prev = null;

    while (curr != null) {
      var next = curr.next;
      curr.next = prev;
      prev = curr;
      curr = next;
    }
    tail = head;
    head = prev;
  }

//<<<<<<<<<<.......Remove At.......>>>>>>>>>>

  removeAt(int index) {
    if(index<0 || index>size){
      print('invalid index');
      return;
    }
    if (index == 0) {
      
      if (this.size == 1) {
        this.head = null;
        this.tail = null;
      } else {
        this.head = this.head?.next;
      }
    } else {
      Node? removeNode;
      var curr = this.head;
      for (var i = 0; i < index - 1; i++) {
        curr = curr!.next;
      }
      removeNode = curr!.next;
      curr.next = removeNode!.next;
      if (index == this.size - 1) {
        this.tail = curr;
      }
    }
    this.size--;
  }
 
//<<<<<<<<<<.......Sum.......>>>>>>>>>>

  int sumOf() {
    int sum = 0;
    var curr = this.head;
    while (curr != null) {
      sum += curr.value;
      curr = curr.next;
    }
    return sum;
  }

//<<<<<<<<<<.......Remove Value.......>>>>>>>>>>

  removeVal(value) {
    var prev = this.head;
    if (value == this.head?.value) {
      this.head = this.head?.next;
      this.size--;
      return;
    } else {
      var removeNode;
      while (prev?.next != null && prev!.next!.value != value) {
        prev = prev.next;
      }
      removeNode = prev?.next;
      prev?.next = removeNode.next;
      this.size--;
      return;
    }
  }
  
//<<<<<<<<<<.......Merge.......>>>>>>>>>>

  merge(LinkedList list2) {
    if (head == null) {
      return list2;
    }
    tail!.next = list2.head;
    tail = list2.tail;
    size += list2.size;
    list2.head = list2.tail = null;
    list2.size = 0;
  }

  //<<<<<<<<<<.......Middle.......>>>>>>>>>>

  middle() {
    var slow = head;
    var fast = head;
    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    return slow!.value;
  }

//<<<<<<<<<<.......Palindrome.......>>>>>>>>>>

  isPalindrome() {
    Node? curr = head;
    List<String> str = [];

    while (curr != null) {
      str.add(curr.value as String);
      curr = curr.next;
    }

    int start = 0;
    int end = str.length - 1;

    while (start < end) {
      if (str[start] != str[end]) {
        return false;
      }
      start++;
      end--;
    }

    return true;
  }

//<<<<<<<<<<.......search.......>>>>>>>>>>

  search(val) {
    int i = 0;
    Node? curr = head;

    while (curr != null) {
      if (curr.value == val) {
        return i;
      }
      curr = curr.next;
      i++;
    }

    return -1;
  }

//<<<<<<<<<<.......second Largest.......>>>>>>>>>>

  int findSecondMax() {
    if (head == null) {
      print("List is empty.");
    }

    int max = head!.value;
    int secondMax = head!.value;
    Node? curr = head;

    while (curr != null) {
      if (curr.value > max) {
        secondMax = max;
        max = curr.value;
      } else if (curr.value > secondMax && curr.value != max) {
        secondMax = curr.value;
      }
      curr = curr.next;
    }

    return secondMax;
  }

//<<<<<<<<<<.......Remove Duplicate.......>>>>>>>>>>

  removeDuplicates() {
    Set<int> seen = {};
    Node? curr = head;
    Node? prev;

    while (curr != null) {
      if (seen.contains(curr.value)) {
        prev?.next = curr.next;
        if (curr == tail) {
          tail = prev;
        }
      } else {
        seen.add(curr.value);
        prev = curr;
      }
      curr = curr.next;
    }
  }

  printList() {
    var current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}

void main() {
  final list = LinkedList();
  list.append(10);
  list.append(20);
  list.append(30);
  list.append(40);
  list.append(50);
  list.preppend(11);
  list.insert(1, 99);
 
  // print(list.findSecondMax());


  // list.removeAt(0);

  //print(list.sumOf());

  //list.reverse();
  list.printList();

  // final list2 = LinkedList();

  // list2.append(200);
  // list2.append(200);
  // list2.append(200);
  // list.merge(list2);

  // list.printList();
}