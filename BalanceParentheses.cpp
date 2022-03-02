#include<bits/stdc++.h>
using namespace std;

int main(){
    stack<char> p;
    string s;
    cout<<"Enter string of parentheses to balance";
    cin>>s;
    for(char i:s){
        if(i=='('||i=='{'||i=='['){
            p.push(i);
        }

        if(i==')' && p.top()=='('){
            p.pop();
        }
        else if(i=='{' && p.top()=='{'){
            p.pop();
        }
        else if(i==']' && p.top()=='['){
            p.pop();
        }
    }

    if(p.empty())   cout<<"Balanced";
    else    cout<<"Unbalanced";
    return 0;
}