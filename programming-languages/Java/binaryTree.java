public class binaryTree{
	Node root;

	public void addNode(int n){
		Node newNode = new Node(n);

		if(root ==null){
			root = newNode;
		}
		else{
			Node currentNode = root;
			Node parent;

			while(true){
				parent = currentNode;
				if(n < currentNode.data){
					currentNode = currentNode.left;
					if(currentNode == null){
						parent.left = newNode;
						return;
					}
				}
				else{
					currentNode = currentNode.right;
					if(currentNode == null){
						parent.right = newNode;
						return;
					}
				}

			} 
		}
	}

	public void inorderTraversal(Node currentNode){
		
		if(currentNode != null){
			inorderTraversal(currentNode.left);
			System.out.println(currentNode + "--->" + currentNode.data);
			inorderTraversal(currentNode.right);
		}
	}

	public static void main(String args[]){
		binaryTree tree = new binaryTree();

	tree.addNode(9);
    tree.addNode(4);
    tree.addNode(15);
    tree.addNode(6);
    tree.addNode(12);
    tree.addNode(17);
    tree.addNode(2);

    	System.out.println("Inorder Traversal");
    	tree.inorderTraversal(tree.root);
	}
}

class Node{
	int data;
	Node left;
	Node right;

	Node(int n){
		this.data = n;
		this.left = null;
		this.right = null;
	}
}