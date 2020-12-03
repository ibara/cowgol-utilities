#include <stdio.h>

#define XMAX	80
#define YMAX	24

unsigned char cells[YMAX][XMAX];

static void
consoleclear(void)
{

	printf("\033[2J\033[2H");
}

static void
display(void)
{
	int x, y;

	consoleclear();

	y = 0;
	while (y < YMAX) {
		x = 0;
		while (x < XMAX) {
			putchar(cells[y][x]);

			x = x + 1;
		}

		putchar('\n');

		y = y + 1;
	}
}

int
main(int argc, char *argv[])
{
	int x, y;

	y = 0;
	while (y < YMAX) {
		x = 0;
		while (x < XMAX) {
			cells[y][x] = ' ';

			x = x + 1;
		}

		y = y + 1;
	}

	consoleclear();

	cells[3][8] = 'X';
	cells[3][9] = 'X';
	cells[3][10] = 'X';
	cells[3][11] = 'X';
	cells[3][12] = 'X';
	cells[3][13] = 'X';
	cells[3][14] = 'X';
	cells[3][15] = 'X';

	display();

	return 0;
}
