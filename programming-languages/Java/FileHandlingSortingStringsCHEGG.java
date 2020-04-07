/*Step 1:

Create a program that will generate 1000 random Strings of 7 length and place them into one file.

 The file that this program will create is to be the data source for the second part.

Step 2:

Read in the file you created in part 1. Create 3 new files and sort the strings into three other files. Strings beginning with A-G || a-g should be written to the first file. Strings starting with H-T || h-t should be written into the second file. Reverse all other strings and place them into the third file.

Print to console the number of words in the longest of the files.
*/

import java.util.*;
import java.io.*;

class FileHandlingSortingStrings{
    public static void clearAllFiles(){
        try{
            File inputFile = new File("dataSource.txt");
            File tempFile = new File("Temp.txt");
            inputFile.delete();
            tempFile.renameTo(inputFile);

            inputFile = new File("AGagFile.txt");
            tempFile = new File("Temp.txt");
            inputFile.delete();
            tempFile.renameTo(inputFile);

            inputFile = new File("HThtFile.txt");
            tempFile = new File("Temp.txt");
            inputFile.delete();
            tempFile.renameTo(inputFile);

            inputFile = new File("Other.txt");
            tempFile = new File("Temp.txt");
            inputFile.delete();
            tempFile.renameTo(inputFile);
            
        }catch(Exception ae){ae.printStackTrace();}
    }

    public static void main(String[] args){
        clearAllFiles(); //to clear all the previous versions and start afresh
        System.out.println("Creating All Files");

        try{
            String filepath = "dataSource.txt";
        	FileWriter fw = new FileWriter(filepath,true);
        	PrintWriter pw = new PrintWriter(fw);

        	//Define the pool of characters you need to choose a character from
            String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";            
            Random rnd = new Random();
            //char c = chars.charAt(rnd.nextInt(chars.length()));

            //This string will be created over and over again.
            String str = "";
            for (int i = 0; i<1000 ; i++){
                for(int j=0; j<7; j++){
                	//choose a character
                    char c = chars.charAt(rnd.nextInt(chars.length()));
                    
                    //append the character to the string
                    str = str + c;
                }
	            pw.println(str);
	            str = "";
	            pw.flush();
            }      
                
            pw.close();
        }catch(Exception ae){ae.printStackTrace();}

        System.out.println("The dataSource File is created");
		sortFile();
        count();
    }

    public static void sortFile(){
        System.out.println("Sorting the DataSource file");

        try{
            //to write to this file
            String filepath1 = "AGagFile.txt";
            FileWriter fw1 = new FileWriter(filepath1,true);
            PrintWriter pw1 = new PrintWriter(fw1);

            String filepath2 = "HThtFile.txt";
            FileWriter fw2 = new FileWriter(filepath2,true);
            PrintWriter pw2 = new PrintWriter(fw2);

            String filepath3 = "Other.txt";
            FileWriter fw3 = new FileWriter(filepath3,true);
            PrintWriter pw3 = new PrintWriter(fw3);


            //START READING THE DATA SOURCE
            File f = new File("dataSource.txt");
            BufferedReader b = new BufferedReader(new FileReader(f));
            String readLine = "";

            String output = "";
            while((readLine = b.readLine()) != null){
                char firstChar = readLine.charAt(0);
                int ascii = (int) firstChar;


                //ASCII values for a-g = 97-103 || A-G = 65-71 
                if( ((ascii >= 97) && (ascii<=103)) || ((ascii >= 65) && (ascii<=71))){
                    output = readLine;
                    pw1.println(output);
                    output = "";
                    pw1.flush();
                }

                //ASCII values for h-t = 104-116 || H-T = 72-84
                else if( ((ascii >= 104) && (ascii<=116)) || ((ascii >= 72) && (ascii<=84))){
                    output = readLine;
                    pw2.println(output);
                    output = "";
                    pw2.flush();
                }

                else{   //Reverse the string first
                    output = readLine;

                    String reverse = "";
                    for(int i = output.length()-1; i>=0; i--){
                        reverse = reverse + output.charAt(i);
                    }
                    pw3.println(reverse);
                    output = "";
                    pw3.flush();
                }
            }
            b.close();  //close reader
            pw1.close();
            pw2.close();
            pw3.close();
            fw1.close();
            fw2.close();
            fw3.close();
        }catch(Exception ae){ae.printStackTrace();}

        System.out.println("DONE. Open the files to check.");
    }


    public static void count(){ //count total # of ques
        System.out.println("Counting lines in each file\n");

        int cTwo, cThree, cFour;
        int longest;
        System.out.println("Number of lines in dataSource is 1000");

        try{
            //int cTwo;
            LineNumberReader reader  = new LineNumberReader(new FileReader("AGagFile.txt"));
            String lineRead = "";
            while ((lineRead = reader.readLine()) != null) {}
                cTwo = reader.getLineNumber(); 
            reader.close();
            System.out.println("Number of lines in AGagFile is: " + cTwo);
            longest = cTwo;


            reader  = new LineNumberReader(new FileReader("HThtFile.txt"));
            lineRead = "";
            while ((lineRead = reader.readLine()) != null) {}
                cThree = reader.getLineNumber(); 
            reader.close();
            System.out.println("Number of lines in HThtFile is: " + cThree);
            if(cThree>longest){
                longest = cThree;
            }


            reader  = new LineNumberReader(new FileReader("Other.txt"));
            lineRead = "";
            while ((lineRead = reader.readLine()) != null) {}
                cFour = reader.getLineNumber(); 
            reader.close();
            System.out.println("Number of lines in Other is: " + cFour);
            if(cFour>longest){
                longest = cFour;
            }        

            int sum = cTwo+cThree+cFour;
            System.out.println("The sum is: " + sum);

            System.out.println("The longest file contains lines: " + longest);

        }catch(IOException e){
            e.printStackTrace();
        }
    }
}