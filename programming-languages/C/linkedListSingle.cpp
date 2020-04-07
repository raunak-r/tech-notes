#include<iostream>
using namespace std;

struct Node{
	int data;
	struct Node* next;
};
struct Node* head;

struct Node* createNode(int n){
	struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
	newNode->data = n;
	newNode->next = NULL;
	return newNode;
}
void insertFirst(int n){
	struct Node* temp = createNode(n);
	
	if(head!=NULL){
		temp->next = head;
	}
	head = temp;
}

void insertLast(int n){
	struct Node* temp = createNode(n);
	
	struct Node* current=(struct Node*)malloc(sizeof(struct Node));
	if(head==NULL){
		head = temp;
	}
	else if(head!=NULL){
		current = head;
		while(current->next!=NULL){
			current=current->next;
		}
		current->next=temp;
	}
}


void insertAt(int n, int pos){
	struct Node* temp = (struct Node*)malloc(sizeof(struct Node));
	struct Node* current = (struct Node*)malloc(sizeof(struct Node));
	temp->data = n;
	temp->next = NULL;

	current = head;
	int i=0, count=0;
	if(pos==1){
		temp->next=head;
		head=temp;
		return;
	}

	for(i=0;i<pos-2;i++){
		current=current->next;
	}
	temp->next= current->next;
	current->next = temp;
}


void deleteBeg(){
	if(head==NULL){
		printf("List is empty.\n");
		return;
	}

	struct Node* current=(struct Node*)malloc(sizeof(struct Node));
	current = head;
	head = current->next;
	/*current->data = NULL;
	current->next = NULL;*/
	free(current);
}


void deleteEnd(){
	if(head == NULL){
		printf("List is empty\n");
		return;
	}

	struct Node* seclast=(struct Node*)malloc(sizeof(struct Node));
	struct Node*    last=(struct Node*)malloc(sizeof(struct Node));
	seclast = head;
	last=head;

	while(seclast!=NULL && seclast->next!=NULL)
    {
        last=seclast;
        seclast=seclast->next;
    }
    if(seclast==last)
    {
        head=NULL;
        free(seclast);
    }
    else
    {
        free(last->next);
        last->next=NULL;
    }
}

void printNodes(){
	if(head==NULL){
		cout << "List is empty" << endl;
		return;
	}

	struct Node* current=(struct Node*)malloc(sizeof(struct Node));
	current = head;
	
	while(current!=NULL){
		cout << current->data << " " << current->next<<endl;
		current=current->next;
	}

}

/*void deleteAt(){}*/

int main(){
	head = NULL;

	cout<<"This is a program to perform 6 functions"<<endl;
	int a=0, flag=1, pos=0;

	while(flag!=0){
		cout<<"1. Insert at Beginning."<<endl;
		cout<<"2. Insert at End."<<endl;
		cout<<"3. Insert at Position."<<endl;
		cout<<"4. Delete at Beginning."<<endl;
		cout<<"5. Delete at End."<<endl;
		cout<<"6. Print the List"<<endl;
		cout<<"0. Exit"<<endl;

		scanf("%d", &flag);

		if(flag==1){
			cin>>a;
			insertFirst(a);
			printNodes();
			cout<<endl;
		}

		if(flag==2){
			cin>>a;
			printNodes();
			cout<<endl;
		}
		
		/*
		if(flag==3){
			printf("Enter number and position");
			scanf("%d %d", &a, &pos);
			insertAt(a, pos);
			printNodes();
			printf("\n");
		}
*/
		if(flag==4){
			deleteBeg();
			printNodes();
		}
		
		if(flag==5){
			deleteEnd();
			printNodes();
		}

		if(flag==6){
			printNodes();
		}

		if(flag==0){
			return 0;
		}
	}
}