#include<stdio.h>
#include<fstream>
#include<string.h>
#include<iostream>
#include<bits/stdc++.h>
using namespace std;

/*
DETAILS OF THE GLOBAL VARIABLES 
*/
double totalDocuments = 0;	//Total Number of reviews which will be later computed as 25000.
double ratingsArray[11] = {0};	//Number of reviews for each rating
double ratingProbability[11] = {0};	//p(rating)

double totalWordFrequency[89527] = {0};	//Sum of all the freq for a word
double wordFreqForRating[11] = {0};	//sum of all the words for a rating
double frequencyArray[11][89527] = {0};	
double real_prob[11]={1};	//for a review, p of each rating
double totalWords = 0;

double pos = 0;	//calculated review = given review
double neg = 0;
int rating; 	//given rating for a review

/*There are 10 classes 1-10*/

int main(){
    ifstream trainingData;
    trainingData.open("trainingData.feat");

    //START READING FILE
    /*
    The format is one:two
    The string 'one' is converted to wordPos and 
    string 'two' is converted to wordFreq
    */
    int i=0;
    string word;
    int currentRating;
    int wordFreq, wordPos;
    while(trainingData >> word){
        //cout << word << endl;

        if(word.length() <= 2){
            currentRating = atoi(word.c_str());
            ratingsArray[currentRating]++;
            continue;
        }
        else{
            wordPos = atoi(word.c_str());
            reverse(word.begin(), word.end());
            wordFreq = atoi(word.c_str());
            frequencyArray[currentRating][wordPos] += wordFreq;
        }
    }

    //CALCULATING THE TOTAL NUMBER OF DOCUMENTS
    for(i=0; i<=10; i++){
        totalDocuments = totalDocuments + ratingsArray[i];
    }
    cout << "Total number of Documents are " << totalDocuments << endl;

    for(i=0; i<=10; i++){
    	cout << ratingsArray[i] << " "; 
    }
    cout << endl;

	//CALCULATE PROBABILITY P(c)    
    for(i = 1; i<=10; i++){
    	ratingProbability[i] = ratingsArray[i] / totalDocuments; 
    }

    for(i = 0; i<=10; i++){
    	cout << ratingProbability[i] << " "; 
    }
    cout << endl;
    //CALCULATE WORD FREQUENCY
   	for(i=0; i<=89527; i++){
    	for(int j=1; j<=10; j++){
    		totalWordFrequency[i] += frequencyArray[j][i];
    	}
    }

    //CALCULATE TOTAL WORDS FOR A GIVEN RATING
   	for(i=1; i<=10; i++){
    	for(int j=0; j<=89527; j++){
    		wordFreqForRating[i] += frequencyArray[i][j];
    	}
    }


//*******************************************
    //READ TEST DATA
    ifstream testData;
    testData.open("testData.feat");
    while(testData >> word){

    	if(word.length() <=2 && word != "\n"){
    		
    		for(i=1; i<=10; i++){
    			real_prob[i] *= ratingProbability[i];
    		}

    		double max=0;
    		int index;	//calculate rating of the previous review
    		for(i=1; i<=10; i++){
    			if(real_prob[i] > max){
    				max = real_prob[i];
    				index = i;
    			}
    		}
    		
    		if((index <=4 && rating<=4 ) || (index>=7 &&rating>=7)) 
    			pos++;
    		else
    			neg++;

    		for(i=1; i<=10; i++){
    			real_prob[i]=1;
    		}
    		real_prob[5]=real_prob[6]=0;
    		rating = atoi(word.c_str());
            
            continue;
        }

        else{
            wordPos = atoi(word.c_str());
            wordFreq = atoi(word.c_str());

            for(i=1; i<=10; i++){
            	if(frequencyArray[rating][wordPos] == 0)
            		continue;
            		//real_prob[i] *= 1/wordFreqForRating[i];

            	else
            		real_prob[i] = real_prob[i] * frequencyArray[i][wordPos] / wordFreqForRating[i];
            }
        }
    }

	double precision = 0;
	precision = 100*pos/(pos+neg);
	cout << precision << endl;

    //CLOSE FILE
    trainingData.close();
    testData.close();

    return 0;
}