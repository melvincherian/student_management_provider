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
  tail?.next=node;
  tail=node;
}

size++;

}

preppend(value){
  Node?node=Node(value);
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


}