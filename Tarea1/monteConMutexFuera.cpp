#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>
#include <math.h>
#include <stdint.h>

#define MAX_THREADS 50000

int total_threads;
int points_inside_circle = 0;
int total_points;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void* throw_darts(void* arg) {
    int childID = (uintptr_t)arg;
    int points_per_thread = total_points / total_threads;
    unsigned int seed = time(NULL) * (childID + 1);
    int local_points_inside_circle = 0;
    for (int i = 0; i < points_per_thread; i++) {
        double x = (double)rand_r(&seed) / RAND_MAX;
        double y = (double)rand_r(&seed) / RAND_MAX;
        if (sqrt(x * x + y * y) <= 1) {
            local_points_inside_circle++;
        }
    }
    pthread_mutex_lock(&mutex);
    points_inside_circle += local_points_inside_circle;
    pthread_mutex_unlock(&mutex);
    return NULL;
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        printf("Uso: %s <total_points> <total_threads>\n", argv[0]);
        return 1;
    }
    total_points = atoi(argv[1]);
    total_threads = atoi(argv[2]);
    if (total_threads > MAX_THREADS) {
        printf("El número de hilos no puede ser mayor a %d\n", MAX_THREADS);
        return 1;
    }
    if (total_points % total_threads != 0) {
        printf("El número de puntos debe ser divisible entre el número de hilos\n");
        return 1;
    }

    pthread_t threads[MAX_THREADS];
    for (int i = 0; i < total_threads; i++) {
        pthread_create(&threads[i], NULL, throw_darts, (void*)(uintptr_t)i);
    }

    for (int i = 0; i < total_threads; i++) {
        pthread_join(threads[i], NULL);
    }

    double pi = 4.0 * points_inside_circle / total_points;
    printf("Valor de pi: %f\n", pi);
    return 0;
}
