#include<stdio.h>
#include<stdlib.h>
int top=-1;

struct Node{
	int data;
	struct Node* next;
};
struct Node* head;

struct Node* createNode(int xb){
	struct Node* newNode=(struct Node*)malloc(sizeof(struct Node));
	newNode->data=xb;
	newNode->next=NULL;
	return newNode;
}

void insertLast(int xa){
	struct Node* temp = createNode(xa);
	if(head==NULL){
		head=temp;
	}
	else{
		struct Node* current=(struct Node*)malloc(sizeof(struct Node));
		while(current->next!=NULL){
			current=current->next;
		}
		current->next=temp;
	}

}

int deleteEnd(){
	if(top==-1){
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

    int ret;
    if(seclast==last)	//i.e. only one elem in list
    {
        head=NULL;
        ret = seclast->data;
        free(seclast);
        return ret;
    }
    else
    {	
    	ret = seclast->data;
        free(last->next);
        last->next=NULL;
        return ret;
    }
}

void push(int x){
	top++;
	insertLast(x);
}

int pop(){
	int p=deleteEnd();
	top--;
	return p;
}

void printStack(){
	if(head==NULL){
		printf("List is empty\n");
		return;
	}

	struct Node* current=(struct Node*)malloc(sizeof(struct Node));
	current = head;
	
	while(current!=NULL){
		printf("%d %p\n", current->data, current->next);
		current=current->next;
	}
	printf("\n");
}

int main(){
	head=NULL;

	int flag=-1, input=0;

	while(flag!=0){
		printf("1. Push elem.\n");
		printf("2. Pop elem.\n");
		printf("3. Print Stack.\n");
		printf("0. Exit\n");

		scanf("%d", &flag);

		if(flag==1){
			scanf("%d", &input);
			push(input);
		}

		if(flag==2){
			printf("%d", pop());
			printf("\n");
		}

		if(flag==3){
			printStack();
			printf("\n");
		}

		if(flag==0){
			return 0;
		}
	}
}
