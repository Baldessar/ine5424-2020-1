#define UART0_BASE 0x10009000
#include "defines.h"
typedef struct uart{
  u32 DR; // data register
  u32 DSR;
  u32 pad1[4]; // 8+16=24 bytes to FR register
  u32 FR; // flag register at 0x18
  u32 pad2[7];
  u32 imsc; // imsc register at offset 0x38
}UART;
UART *up; // 4 UART pointers to UART structures

char *tab = "0123456789ABCDEF";


int uputc(char c)
{
  int i = up->FR;
  while((up->FR & 0x20));
  (up->DR) = (int)c;
  return 0;
}

int uart_init()
{
    up= (UART *)(UART0_BASE);
    up->imsc |= (1<<4); // enable UART RXIM interrupt
    return 0;

}

int uprints(char *s)
{
  while(*s){
    uputc(*s);
    s++;
  }
  return 0;

}

int urpx(u32 x)
{
  char c;
  if (x==0)
     return 0;
  c = tab[x % 16];
  urpx(x / 16);
  uputc(c);
  return 0;

}

int uprintx(u32 x)
{
  uputc('0'); uputc('x');
  if (x==0)
    uputc('0');
  else
    urpx(x);
  uputc(' ');

  return 0;

}

int urpu(u32 x)
{
  char c;
  if (x==0)
     return 0;
  c = tab[x % 10];
  urpu(x / 10);
  uputc(c);
  return 0;

}

int uprintu(u32 x)
{
  if (x==0){
    uputc('0');
  }
  else
    urpu(x);
  uputc(' ');
  return 0;

}

int uprinti(int x)
{
  if (x<0){
    uputc(' ');
    uputc('-');
    x = -x;
  }
  uprintu((u32)x);
  return 0;

}

int uprintf(char *fmt,...)
{
  int *ip;
  char *cp;
  cp = fmt;
  ip = (int *)&fmt + 1;

  while(*cp){
    if (*cp != '%'){
      uputc(*cp);
      if (*cp=='\n')
	    uputc('\r');
      cp++;
      continue;
    }
    cp++;
    switch(*cp){
    case 'c': uputc((char)*ip);      break;
    case 's': uprints((char *)*ip);  break;
    case 'd': uprinti(*ip);          break;
    case 'u': uprintu((u32)*ip);          break;
    case 'x': uprintx((u32)*ip);          break;
    }
    cp++; ip++;
  }
  return 0;

}
