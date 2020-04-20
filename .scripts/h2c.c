#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char input[] = "#000000";
int out[3];

int main(int argc, char* argv[]) {

	if (argc == 2) {
		if (strlen(argv[1]) == 7) {
			strcpy(input, &argv[1][1]);
			char buf[3];
			int c = 0;
			int p = 0;
			int pos = 0;
			while (input[p] != '\0') {
				if (c == 2) {
					c = 0;
					buf[2] = '\0';
					out[pos] = strtol(buf, NULL, 16);
					pos++;
				}
				buf[c] = input[p];
				c++;
				p++;
			}
			buf[2] = '\0';
			out[pos] = strtol(buf, NULL, 16);
			printf("Color( %f, %f, %f, 1 )\n", (float)out[0]/255, (float)out[1]/255, (float)out[2]/255);
		}
	}

	return 0;
}
