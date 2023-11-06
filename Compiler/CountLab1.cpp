#include<iostream>
#include<fstream>
#include<string>
using namespace std;    

int main(){
    // cout<<"Enter your name"<<endl;
    // string n;
    // cin>>n;

//writing to a file
    // ofstream out("test.txt");
    // out<<"My name is "+ n<<endl;
    // out.close();

// reading froma file
char c[50];
char ch;
int word=0,line=0,charcount=0;
// char a ;
char a[50];
ifstream in("test.txt");
  

while (in.get(ch)) {
        charcount++;
    }
    cout<<"The count of characters in file is"<<charcount<<endl;
in.close();
in.open("test.txt");
while(in>>c){
    
    word++;
    }
    cout<<"The count of words in file is"<<word<<endl;
in.close();

in.open("test.txt");


while(in.getline(a,50)){

    
    line++;
    }
    cout<<"The count of line in file is"<<line<<endl;

in.close();

}