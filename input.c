// Single-line comment
int a;
float b;
/* Multi-line
   comment */
   
void func(int x) { //function defination
    char c;
    printf("This is example function %d!!",x);
}

void main(){
   int x;
   // user input
   printf("Enter any number: ");
   scanf("%d",&x);

// Function Call
   func(x);
}