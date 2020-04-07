terminal> javac filename.java
terminal> java filenames

import java.util.*;			//for all utility functions. like scanner.


class Reference{		
	int var1;				//the Variables defined here are instance variables.
	
	Reference(){  			//Default Constructor. Constructor has the same name as the function it is inside.
		x =10;
		y =20;
	}
	
	Reference(int i, int j){//Parameterized Constructor
		x=i;
		y=j;
	}
	
	void get(){				//Example of Method Overloading.
		x=1;
		y=1;
	}
	
	void get(int i, int j){	//Method Overloading example. When the function has different parameters but same name.
		x=i;
		y=j;
	}
	
}

class ReferenceForJava{		//The name of main class and file name is saved with the same name.
	public static void main(String args[]){
		
		Scanner scan = new Scanner(System.in);  //Using Scanner to input.
	    int i = scan.nextInt();					//Input an integer.
	    double d = scan.nextDouble();			//Input a double.
	    scan.close();							//Stop taking input.
	        
		System.out.println("String: " + s);	        
        System.out.println("Double: " + d);
        System.out.println("Int: " + i);
		
		int a=0;			//METHOD ONE where Array is predefined.
		int[] arr1 = {1,343,45};
				
		int b;				//METHOD TWO where Array SIZE is predefined.
		int[] arr2 = new int[5];
		
		int j;				//METHOD THREE where Array size is given in run time.
		int i=0;		
		j = scan.nextInt();
		int arr3[] = new int[j]; 
		
		{					//SIMPLE EXAMPLE OF TRY AND CATCH BLOCK
			try{                           
			int data = 50/0;
			}
		
			catch (ArithmeticException e){
				System.out.println(e);
			}
		}
							
							//To output text in a file.
		FileOutputStream fout = new FileOutputStream("abc.txt");
			String s = "Sachin tendulkar is not god.";
			byte b[] = s.getBytes(); //It reads the letters and and stores it like a string.
			fout.write(b);
			fout.close();
	}
}

class A extends B{			//When class A includes B.
	
}