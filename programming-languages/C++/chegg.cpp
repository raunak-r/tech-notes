#include <iostream>
#include <fstream>
#include <string>
using namespace std;

string process (string line) {
      string word="";
      string newline="";
      line=line+' ';
      
      for(int i=0; i<line.length();i++)
      {
        if(line.at(i)==' ')
        {
            if(word.length()==1)
             word.at(0)=toupper(word.at(0));
             
            else if(word.length()>1)
            {
                word.at(0)=toupper(word.at(0));
                word.at(1)=toupper(word.at(1));
            }
            
            newline=newline+word+" ";
            word="";
        }
        
        else
        word=word+line.at(i);
          
      }
      return(newline);
    
}



int main () {
  string line;
  ifstream myfile ("data.txt");
  if (myfile.is_open())
  {
    while ( getline (myfile,line) )
    {
        string newline=process(line);
        
        cout <<"Processed string: " <<newline << '\n';
        cout <<"Original string: " <<line << '\n';
    
        
    }
    
    myfile.close();
  }

  else cout << "Unable to open file"; 

  return 0;
}


