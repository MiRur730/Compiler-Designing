#include <iostream>
#include <fstream>

using namespace std;
//The useful classes are fstreambase ,
//ifstream,ofstream    --derived from fstreambase


//in ordre to open a fille you have two ways 
//1 using a constructor
//using member function open() of the class


int main(){
    string a ;

    // ofstream fout;
    // fout.open("mitali.txt");  // it willl create it

    // ofstream out("mitali.txt");
    // out<<"thanks for intro "; //overwrite hoga jo already i wrote in file
    // out<<"hi i am mitali";



    // Reading to it

    ifstream in("mitali.txt");
    // in>>a; //this way only first word will be read
    getline(in,a);
    cout<<a<<endl;
}