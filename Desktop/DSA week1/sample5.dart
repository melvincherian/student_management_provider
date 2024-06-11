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

insert(value ,index){

if(index<0 || index>size){
  print('Invalid index');
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
  current=current?.next;
  newnode.next=current!.next;
  current.next=newnode;
  if(index==size)tail=newnode;
}


}
size++;

}


}