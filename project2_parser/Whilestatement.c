#include <stdio.h>

void main(){
		int c;
		float d;
		c = 30;
		d = 50.5;

		while(d >= c || c*2 > d){
				d = c*2+5;
				printf("d>=c");
				d = d*5+2;
				printf("d is greater than c");
		}

		return 0;
}
