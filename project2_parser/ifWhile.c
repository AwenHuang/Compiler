#include  <stdio.h>

void main(){

	int e;
	int f;
	e = 10;
	f = 15;
	if(f > e){
			e = f+e;
			while(e > f)
					f = f*2;
	}
	return 0;
}
