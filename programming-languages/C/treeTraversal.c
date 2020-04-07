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

void preorder(struct Node* tree){	//root,left,right
	if( tree != NULL){
		printf("%d ", tree->data);
		preorder(tree->left);
		preorder(tree->right);
	}
}

void inorder(struct Node* tree){	//left,root,right
	if( tree != NULL){
		inorder(tree->left);
		printf("%d ", tree->data);
		inorder(tree->right);
	}
}

void postorder(struct Node* tree){	//left,right,root
	if( tree != NULL){
		postorder(tree->left);
		postorder(tree->right);
		printf("%d ", tree->data);
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

    printf("\nPreorder display\n");
    preorder(root);

    printf("\nInorder display\n");
    inorder(root);

    printf("\nPostorder display\n");
    postorder(root);

	return 0;
}