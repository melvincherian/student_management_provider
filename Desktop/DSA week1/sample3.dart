class Node{

late int value;

Node?next;
Node(this.value);



}
class LinkedList{

Node?head;
Node?tail;

int size=0;

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

}

// insert(value,index){

// if(index <0 || index>value){
//   print('Invalid index');
//   return;
// }
// Node?node=Node(value);

// if(index==0){
//   node.next=head;
//   head=node;
//   if(tail==null) tail=node;
// }
// else{
//   Node?current=head;
//   for(int i=0;i<index-1;i++){
//     node.next=current!.next;
//      current.next=node;
//      if(index==size)tail=node;
//   }
// }
// size++;
// }

insert(value,index){

if(index <0 || index>value){
print('Invalid index');
return;
}

Node?node=Node(value);
if(index==0){

node.next=head;
head=node;

if(tail==null)tail=node;



}
else{
  Node?current=head;
  for(int i=0;i<index-1;i++){
  current=current?.next;
  node.next=current!.next;
  current.next=node;

 if(index==size)tail=node;


  }


}
size++;
}


}
void main(){

final list=LinkedList();

list.append(10);
list.append(20);

}