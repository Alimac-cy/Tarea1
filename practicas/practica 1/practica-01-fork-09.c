// practica-01-fork-08.c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main(void)
{
    printf("Process start\n");
    int total_forks = 5;
    char *msg = malloc(1024 * 1024 * 1024);
    snprintf(msg, 100, "I'm the parent process!!!\n");
    printf("[Parent] The address of msg is: %p | Value is: %s\n", msg, msg);
    memset(msg, 'A', 1024 * 1024 * 1024); 

    for (int i = 0; i < total_forks; i++)
    {
        pid_t pid = fork();
        if (pid == 0)
        {
            snprintf(msg, 100, "hello from child %d", i);
            printf("[Child %d] The address of msg is: %p | Value is: %s\n", i, msg, msg);
            sleep(10);
            return 0;
        }
    }
    for (int i = 0; i < total_forks; i++)
    {
        wait(NULL);
    }
    printf("[Parent] The program ends\n");
    printf("[Parent] The final value of msg is: %s\n", msg);
    return 0;
}