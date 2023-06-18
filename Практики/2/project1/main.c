#include <8051.h>
void main()
{
	unsigned int i, cnt = 0, a= 0, count = 0;
	unsigned char *str="yegor";
	unsigned char *str2="k e k e k e k";
	P0 = 0x38;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0x80;
	P2 = 0x1;
	P2 = 0x0;
		for(i=0;i<14;i++) 
		{
			P0 = str[i];
			P2 = 0x3;
			P2 = 0x2;
		}
	P0 = 0xC0;
	P2 = 0x1;
	P2 = 0x0;
	i = 15;
	while(1)
	{
		while (cnt<i)
			{
				P0 = str2[cnt];
				P2 = 0x3;
				P2 = 0x2;
				cnt++;
			}
				cnt = i - count;
		while (cnt<15)
		{
			if(a<count)
				{
					a++;
					P0 = str2[a-1];
					P2 = 0x3;
					P2 = 0x2;
					cnt++;
				}
		}
		a=0;
		P0 = 0xC0;
		P2 = 0x1;
		P2 = 0x0;
		count++;
		cnt = count;
	}
}