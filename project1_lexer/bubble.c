#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MAX 10
#define SWAP(x,y) {int t;t=x;x=y;y=t;}
void bubblesort(int[],int);
int main(void)
{
		int num[MAX]={0};
		int i;
		srand(time(NULL));
		printf("排序前:");
		for(i=0;i<MAX;i++)
		{
				num[i]=rand()%100;
				printf("%d ",num[i]);
		}
		bubblesort(num,MAX);
		printf("\n排序後:");
		for(i=0;i<MAX;i++)
				printf("%d ",num[i]);
		printf("\n");
		return 0;
}
void bubblesort(int num[],int N)
{
		int i,j;
		for(i=0;i<N-1;i++)
		{
				for(j=0;j<N-1-i;j++)
				{
						if(num[j]>num[j+1])
						SWAP(num[j],num[j+1]);
				}
		}
}
