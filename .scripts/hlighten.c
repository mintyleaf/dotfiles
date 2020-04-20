#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char input[] = "#000000";
float out[3];

int main(int argc, char* argv[]) {

	if (argc == 3) {
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
			out[0] *= strtof(argv[2], NULL) + 1;
			if (out[0] > 255) {
				out[0] = 255;
			}
			out[1] *= strtof(argv[2], NULL) + 1;
			if (out[1] > 255) {
				out[1] = 255;
			}
			out[2] *= strtof(argv[2], NULL) + 1;
			if (out[2] > 255) {
				out[2] = 255;
			}
			printf("#%02x%02x%02x\n", (int)out[0], (int)out[1], (int)out[2]);
		}
	}

	return 0;
}
