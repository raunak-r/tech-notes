#include<stdio.h>
#include<stdlib.h>

struct Node{
	int data;
	struct Node* right;
	struct Node* left;
};

struct Node* createNode(int value){
	struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
	newNode->data=value;
	newNode->left = newNode->right = NULL;
	return newNode;	
}

void insert(struct Node** tree, int value){

	if(*tree==NULL){
		/*struct Node* temp = (struct Node*)malloc(sizeof(struct Node));
		temp->left = temp->right = NULL;
		temp->data = value;
		*tree = temp;
		return;*/
		
		*tree = createNode(value);
	}

	if(value < (*tree)->data){
		insert(&((*tree)->left),value);
	}
	else if(value > (*tree)->data){
		insert(&((*tree)->right), value);
	}
}

struct Node* search(struct Node** tree, int value){
	if(*tree == NULL){
		return NULL;
	}
	if(value == (*tree)->data){
		return *tree;
	}
	else if( value < (*tree)->data ){
		search(&((*tree)->left), value);
	}
	else if( value > (*tree)->data ){
		search(&((*tree)->right), value);
	}
}

void display(struct Node* tree){
	if( tree != NULL){
		display(tree->left);
		printf("%d ", tree->data);
		display(tree->right);
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

    printf("Inorder display\n");
    display(root);

	return 0;
}