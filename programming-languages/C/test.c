#include<stdio.h>
#include<stdlib.h>

struct Node{
	int data;
	struct Node* left;
	struct Node* right;
};

struct Node* createNode(int value){
	struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
	newNode->data=value;
	newNode->left = newNode->right = NULL;
	return newNode;	
}

void insert(struct Node** tree, int value){
	if(*tree==NULL){
		*tree = createNode(value);
	}

	if(value < (*tree)->data){
		insert(&((*tree)->left),value);
	}
	else if(value > (*tree)->data){
		insert(&((*tree)->right), value);
	}
}

int main(){
	struct Node* root = NULL;

	insert(&root, 9);
    insert(&root, 4);
    insert(&root, 15);
    insert(&root, 6);
    insert(&root, 12);
    insert(&root, 17);
    insert(&root, 2);

    return 0;
}