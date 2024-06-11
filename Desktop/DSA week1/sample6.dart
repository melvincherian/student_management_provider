class Node{

var  value;

Node?prev;
Node?next;

Node(this.value);



}
class DoublyLinkedlist{


Node?head;
Node?tail;

var size=0;

append(value){

Node node=Node(value);

if(head==null){
  head=node;
  tail=node;
}
else{
  node.prev=tail;
  tail!.next=node;
  tail=node;
}

size++;

}

remove(index){

if(index<0 || index>size){
  print('Invalid index');
  return;
}

if(index==0){
  if(this.size==1){
  this.  head=null;
  this.  tail=null;
  }
  else{
    this.head=this.head?.next;  
    }
   
}
else{
  Node?removeNode;
var curr=this.head;
for(int i=0;i<index-1;i++){
  curr=curr!.next;

}
removeNode=curr!.next;
curr.next=removeNode!.next;

if(index==size-1){
  this.tail=curr;
}

}
this.size--;





}


}