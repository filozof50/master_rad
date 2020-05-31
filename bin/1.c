#include <stdio.h>
#include <assert.h>
#include <klee/klee.h>
#include <stdlib.h>

// int main ()
// {
// 	int i = 2, x, y;

// 	klee_make_symbolic(&x, sizeof(x), "x");

// 	while (i) {
// 		if (x > 10) {
// 			y = 2;
// 		}
// 		else {
// 			y = 6;
// 		}
// 		i--;
// 	}
	
// 	return 0;
// }

// int main ()
// {
// 	int a[10], x, y, j;

// 	klee_make_symbolic(&a, sizeof(a), "a");
// 	klee_make_symbolic(&x, sizeof(x), "x");
// 	klee_make_symbolic(&y, sizeof(y), "y");
// 	klee_make_symbolic(&j, sizeof(j), "j");

// 	int i = 1;

// 	if (x > 0) {
// 		x = 10;
// 	}
// 	else {
// 		i--;
// 	}
	
// 	if (y < 0)
// 		y = 10;
// 	else
// 		i--;

// 	a[j] = 5;

// 	return 0;
// }

// int main ()
// {
// 	int a, b;

// 	klee_make_symbolic(&a, sizeof(a), "a");
// 	klee_make_symbolic(&b, sizeof(b), "b");

// 	int x = 5;

// 	int y = a / x;

// 	int z = a / b;

// 	return 0;
// }

// int main ()
// {
// 	int a, b;
// 	klee_make_symbolic(&a, sizeof(a), "a");
// 	klee_make_symbolic(&b, sizeof(b), "b");

// 	int counter = 2;

// 	if (a < 0)
// 		a = 10;
// 	else 
// 		counter--;
	
// 	if (b < 0)
// 		b = 10;
// 	else
// 		counter--;

// 	int x = 10 / counter;

// 	return 0;

// }

// void foobar(int a) 
// {
// 	if (a > 1000) {
// 		a /= 2;

// 		if (a > 700) {
// 			a /= 2;

// 			if (a > 400) {
// 				a /= 2;
// 			}
// 			else {
// 				return ;
// 			}
// 		}
// 		else {
// 			a *= 2;

// 			if (a < 1100) {
// 				return ;
// 			}
// 			else {
// 				a *= 2;
// 			}
// 		}
// 	}
// 	else {
// 		a *= 2;

// 		if (a > 1200) {
// 			a /= 2;

// 			if (a > 700) {
// 				a /= 2;
// 			}
// 			else {
// 				return ;
// 			}
// 		}
// 		else {
// 			a *= 2;
// 			if (a > 1000) {
// 				return ;
// 				// klee_assert(a != 1004);
// 				// a *= 2;
// 			}
// 			else {
// 				a *= 2;
// 			}
// 		}
// 	}
// }

// int main ()
// {
// 	int x;
// 	klee_make_symbolic(&x, sizeof(x), "x");

// 	foobar(x);

// 	return 0;
// }

// int get_sign(int x) {
//   if (x == 0)
//      return 0;
  
//   if (x < 0)
//      return -1;
//   else 
//      return 1;
// } 

// int main() {
//   int a;
//   klee_make_symbolic(&a, sizeof(a), "a");
//   return get_sign(a);
// } 

// int fact(int n)
// {
// 	if (n < 2) 
// 		return 1;

// 	return fact(n - 1) * n;
// }

// // int f(int x)
// // {
// // 	return x * 2;
// // }

// int main()
// {
// 	int n;

// 	klee_make_symbolic(&n, sizeof(n), "n");

// 	int x = fact(n);

// 	klee_assert(x != 120);

// 	return 0;
// }

// void f(int *a, int x) 
// {
// 	if (x > 3)
// 		a[6] = x;
// 	else 
// 		a[6] = 2;

// 	for (int i = 0; i < 10; i++) {
// 		if (a[i] < 0)
// 			x = 10;
// 		else
// 			x = 0;
// 	}
// 	assert(a[6] != 4);
// }

// int main ()
// {
// 	int a[10];
// 	klee_make_symbolic(&a, sizeof(a), "a");

// 	for (int i = 0; i < 10; i++) {
// 		if (a[i] < 10) {
// 			f(a, i);
// 		}
// 	}

// 	return 0;
// }

int main() {
    int n, i, flag = 0;

    klee_make_symbolic(&n, sizeof(n), "n");

    for (i = 2; i <= n / 2; ++i) {

        if (n % i == 0) {
            flag = 1;
            break;
        }
    }

    klee_assert(n != 0);

    if (n == 1) {
        printf("1 is neither prime nor composite.\n");
    }
    else {
        if (flag == 0)
            printf("%d is a prime number.\n", n);
        else
            printf("%d is not a prime number.\n", n);
    }

    return 0;
}

// void f(int a, int x) {
// 	x++;

// 	klee_assert(a != x);
// }

// int main(int argc, char* argv[]) 
// {
// 	int a, x;
// 	klee_make_symbolic(&a, sizeof(a), "a");
// 	// klee_make_symbolic(&b, sizeof(b), "b");
	
// 	if (a > 0) 
// 		x = 10;
// 	else
// 		x = -10;

// 	f(a, x);

// 	return 0;
// }

/*********** POKAZIVACI
void f(int *a, int b)
{
	*a = 5;
	b = 6;
}

void foo(int x, int y)
{
	x = 3;
	y = 2;
	f(&x, y);
}
**********************/

/************ NIZOVI
void f(int *a)
{
	a[0] = 10;
	a[1] = 20;
	a[2] = 30;
}

void foo(int *a)
{
	f(a);
}
*******************/

/********** PRIMER ZA ANALIZU
void foobar(int a) 
{
	if (a > 1000) {
		a /= 2;

		if (a > 700) {
			a /= 2;

			if (a > 400) {
				a /= 2;
			}
			else {
				return ;
			}
		}
		else {
			a *= 2;

			if (a < 1100) {
				return ;
			}
			else {
				a *= 2;
			}
		}
	}
	else {
		a *= 2;

		if (a > 1200) {
			a /= 2;

			if (a > 700) {
				a /= 2;
			}
			else {
				return ;
			}
		}
		else {
			a *= 2;
			if (a > 1000) {
				return ;
				// klee_assert(a != 1004);
				// a *= 2;
			}
			else {
				a *= 2;
			}
		}
	}
}
****************************/

// void foobar(int x) {
// 	if (x < 10) {
// 		x++;
// 		x++;
// 		x++;
// 		x++;
// 	}

// 	if (x < 10)
// 		return ;

// 	x = 12;
// }






// int abs(int x) 
// {
// 	return x < 0 ? -x : x;
// }

// void foo(int a) 
// {
// 	a = abs(a);
// 	klee_assert(a <= 0);
// }

// int even(int x) 
// {
// 	if(x!=0) {
// 		if (x == 5) {
// 			return 0;
// 		}
// 		else 
// 			return 1;
// 	}
// 	else {
// 		if (x == 5) {
// 			return 0;
// 		}
// 		else 
// 			return 1;
// 	}

// 	klee_assert(0);
// 	return 1; // nedostizna naredba
// }