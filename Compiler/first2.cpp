#include <iostream>
#include <fstream>

using namespace std;

int main(){
    fstream out;
    out.open("mitali.txt");
    out<<"This is nice"<<endl;
    out<<"ALoso me";
    out.close();

    ifstream in;
    in.open("mitali.txt");
    string a;
// getline(in,a);  // this will print only first line
// cout<<a<<endl;

while(in.eof()==0){
    getline(in,a);
    cout<<a;
}
in.close();

}