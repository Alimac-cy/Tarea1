#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>
#include <math.h>
#include <stdint.h>
#include <unistd.h>

#define MAX_THREADS 50000

int total_threads;
int total_points;
int total_points_inside_circle = 0;

pthread_mutex_t points_mutex = PTHREAD_MUTEX_INITIALIZER;

void *throw_darts(void *arg)
{
    int childID = (uintptr_t)arg;
    int fd = *((int *)arg + 1);
    int points_per_thread = total_points / total_threads;
    unsigned int seed = time(NULL) * (childID + 1);
    int points_inside_circle = 0;
    for (int i = 0; i < points_per_thread; i++)
    {
        double x = (double)rand_r(&seed) / RAND_MAX;
        double y = (double)rand_r(&seed) / RAND_MAX;
        if (sqrt(x * x + y * y) <= 1)
        {
            points_inside_circle++;
        }
    }
    write(fd, &points_inside_circle, sizeof(points_inside_circle));
    return NULL;
}

int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        printf("Uso: %s <total_points> <total_threads>\n", argv[0]);
        return 1;
    }
    total_points = atoi(argv[1]);
    total_threads = atoi(argv[2]);
    if (total_threads > MAX_THREADS)
    {
        printf("El número de hilos no puede ser mayor a %d\n", MAX_THREADS);
        return 1;
    }
    if (total_points % total_threads != 0)
    {
        printf("El número de puntos debe ser divisible entre el número de hilos\n");
        return 1;
    }

    int fd[2];
    pipe(fd);

    pthread_t threads[total_threads];
    for (int i = 0; i < total_threads; i++)
    {
        int args[2] = {i, fd[1]};
        pthread_create(&threads[i], NULL, throw_darts, (void *)args);
    }

    for (int i = 0; i < total_threads; i++)
    {
        int points_inside_circle;
        read(fd[0], &points_inside_circle, sizeof(points_inside_circle));
        pthread_mutex_lock(&points_mutex);
        total_points_inside_circle += points_inside_circle;
        pthread_mutex_unlock(&points_mutex);
    }

    for (int i = 0; i < total_threads; i++)
    {
        pthread_join(threads[i], NULL);
    }

    double pi = 4.0 * total_points_inside_circle / total_points;
    printf("Valor de pi: %f\n", pi);

    close(fd[0]);
    close(fd[1]);
    return 0;
}