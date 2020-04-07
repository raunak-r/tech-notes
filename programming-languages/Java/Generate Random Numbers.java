import java.util.*;
import java.io.*;

class Chegg{

  public static void main(String[] args) {
  try{
    String filepath = "random.txt";
    FileWriter fw = new FileWriter(filepath,true);
    PrintWriter pw = new PrintWriter(fw);
    
    for (int i = 0; i < 100 ; i++){
        int random = (int) (Math.random() * 250 + 0);
        
                pw.println(random);
                pw.flush();
                
            
            
    }
    pw.close();
    }
    catch(Exception ae){}
  }
} 