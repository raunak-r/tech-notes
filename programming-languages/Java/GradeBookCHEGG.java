import java.util.Scanner;
import java.io.*;

class GradeBook{
    static int[] scores = new int[5];

    public static void inputScores(){
        int i;
        Scanner scan = new Scanner(System.in);
        
        for(i=0; i<5; i++){
            int grade = scan.nextInt();
            while(grade<25 || grade>100){
                System.out.println("Input a number between 25 to 100");
                grade = scan.nextInt();
            }
            scores[i] = grade;
        }
    }
    
    public static float calcAverage(){
        //System.out.println("in calcAverage");
        float average=0;
        int i;
        
        for(i=0; i<5; i++){
            average = average + (float) scores[i];
        }
        average = average/5;
        
        //to check
        //System.out.println(average);

        return average;
    }
    
    public static char determineGrade(float a){
        //(A = 90-100; B = 80-89; C = 70-79; D = 60-69; F = 0-59).
        float avg = a;
        if(avg<=100 && avg >=90){
            return 'A';
        }
        else if(avg<=89 && avg >=80){
            return 'B';
        }
        else if(avg<=79 && avg >=70){
            return 'C';
        }
        else if(avg<=69 && avg >=60){
            return 'D';
        }
        else if(avg<=59 && avg >=0){
            return 'F';
        }

        return 'F';
    }
    
    public static void printStudentGradeInfo(String name, float avg, char grade){
        System.out.println(name + "\t\t" + avg + "\t\t" + grade);
    }
    
    public static void main(String args[]) throws IOException{
        //Ask for total students;
        
        //Scanner scan = new Scanner(System.in);
        BufferedReader scan = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(scan.readLine());
        //scan.close();

        float avg;
        char letterGrade;
        String name="";

        //FOR EACH STUDENT DO THIS
        while(n != 0){
            //Scanner scan = new Scanner(System.in);
            System.out.print("Enter the student name: ");
            name = scan.readLine();

            inputScores(); // to input the scores
            avg = calcAverage();
            //System.out.println(avg);

            letterGrade = determineGrade(avg);
            //System.out.println(letterGrade);

            printStudentGradeInfo(name, avg, letterGrade);
            System.out.println();

            n--;
        }
        scan.close();
    }
}