#include <LPC214x.h>
// fcuk you 
void cmd(unsigned char d);
void datal(unsigned char t);
void delay (int count);
 
int main()
{
int i;
unsigned char name[]={"ARM_LPC2148"};
 
IO0DIR=0x30403C00;                      
delay(100);

cmd(0x02);								  //cursor home command
cmd(0x01);								  //clear display command
cmd(0x28);								  //4-bit mode entry command(0x38 for 8 bit mode)
cmd(0x06);								  //entry mode command
cmd(0x0C);								  //display on cursor off command
//cmd(0xC0);							  //LCD bottom line display command
 
for (i=0;i<11;i++)
{
datal(name[i]);
}
while(1);
}
 
void cmd(unsigned char d)
{
int a=0;
a = d | 0xFFFFFF0F;
IO0CLR |= 0x00003C00;
a=a<<6;
IO0CLR = 0x20400000;
IO0SET = 0x10000000;
IO0SET =(IO0SET | 0x00003c00)&a;
delay(1000);
IO0CLR = 0x10000000;

a=0x0;
d=d<<4;
a = d | 0xFFFFFF0F;
IO0CLR |= 0x00003C00;
a=a<<6;
IO0CLR = 0x20400000;
IO0SET = 0x10000000;
IO0SET = (IO0SET | 0x00003C00)&a;
delay(1000);
IO0CLR = 0x10000000;
}
void datal(unsigned char t)
{
int b=0;
b = t|0xFFFFFF0F;
IO0CLR |= 0x00003C00;
b=b<<6;
IO0SET = 0x10400000;
IO0SET = (IO0SET | 0x00003C00)&b;
delay(1000);
IO0CLR = 0x10000000;

b=0x0;
t=t<<4;
b=t|0xFFFFFF0F;
IO0CLR |= 0x00003C00;
b=b<<6;
IO0SET = 0x10400000;
IO0SET = (IO0SET | 0x00003C00)&b;
delay(1000);
IO0CLR = 0x10000000;
}
void delay(int count)
{
int j=0, i=0;
for (j=0;j<count;j++)
for (i=0;i<35;i++);
}
