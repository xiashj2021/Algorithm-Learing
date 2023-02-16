#include <stdio.h>
#define N 4

void inputArray(int array[N][N]) {
    int i, j;  // The variable i is row and j is column.
    for (i = 0; i < N; i++) {
        printf("Please input a row of the array:\n");
        for (j = 0; j < N; j++) {
            scanf("%d", &array[i][j]);
        }
    }
}

void printArray(int array[N][N]){
    int i, j;
    printf("The array of its transitive closure is:\n");
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            printf("%d ", array[i][j]);
        }
        printf("\n");
    }
}

void warshall(int array[N][N]) {
    int i, j, k;  // The variable i is column and j is row.
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            if (array[j][i]) {
                for (k = 0; k < N; k++) {
                    array[j][k] = array[j][k] | array[i][k];
                }
            }
        }
    }
}

int main(void) {
    int array[N][N] = {0};
    inputArray(array);
    warshall(array);
    printArray(array);
    return 0;
}
