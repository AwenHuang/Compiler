#include <stdio.h>
void main()
{
		float a;
		int b;
		a=20.5;
		b=10;
			
		if(a>b){
				a=b*2;
				printf("a");
		}
		else if(a<b)
				a=b*3;
		else if(a==b)
				a=b*4;
		else
				a=a+b;


		return 0;
}		
