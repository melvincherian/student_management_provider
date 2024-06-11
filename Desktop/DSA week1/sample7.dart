class Node{

late int value;

Node?next;
Node(this.value);

}
class LinkedList{

Node?head;
Node?tail;

int size=0;

append(value){

Node node=Node(value);
if(head==null){
  head=node;
  tail=node;
}
else{
  tail!.next=node;
  tail=node;
}

size++;
}

preppend(value){
  Node node=Node(value);
  if(head==null){
    head=node;
    tail=node;
  }
  else{
    node.next=head;
    head=node;
  }

  size++;
}

insert(value ,index){

if(index<0 || index>size){
  print('invalid index');
  return;
}

Node newnode=Node(value);
if(index==0){
  newnode.next=head;
  head=newnode;
  if(tail==null)tail=newnode;
}
else{

Node?current=head;
for(int i=0;i<index-1;i++){
  current=current!.next;
  newnode.next=current!.next;
  current.next=newnode;

  if(index==size)tail=newnode;
}

}
size++;
}

remove(index){

if(index==0 || index>size){
  print('invalid index');
  return;
}
if(index==0){
  this.head=this.head!.next;
  this.size--;

}
else{
  var prev;
  var curr;
  for(var i=0;i<index;i++){
    prev=curr;
    curr=curr.next;
  }
  if(curr!=this.tail){
      prev.next=null;
      this.tail=prev;
      this.size--;
  }
  else{
    prev!.next=curr.next;
    this.size--;
  }
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
void main(){
  final list = LinkedList();
  list.append(10);
  list.append(20);
  list.append(30);
  list.append(40);
  list.append(50);
  list.preppend(90);
  list.insert(12, 3);
  list.printList();
}
