#include<iostream>
#include<fstream>
using namespace std;    

int main(){
    cout<<"Enter your name"<<endl;
    string n;
    cin>>n;


    ofstream out("test.txt");
    out<<"My name is "+ n<<endl;
    out.close();


    ifstream in("test.txt");
    string a;
    getline(in,a);
    cout<<"The content is: "<< a<<endl; 
}