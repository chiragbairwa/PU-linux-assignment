#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main(void) {
    // Create the pipe
    int pipefd[2];
    if (pipe(pipefd) == -1) {
        perror("pipe");
        return 1;
    }

    // Fork the process
    pid_t pid = fork();
    if (pid == -1) {
        perror("fork");
        return 1;
    }

    if (pid == 0) {
        // Child process: read from the pipe
        close(pipefd[1]); // Close the write end of the pipe

        // Read from the pipe
        char buf[1024];
        ssize_t n = read(pipefd[0], buf, sizeof(buf));
        if (n == -1) {
            perror("read");
            return 1;
        }

        // Print the message
        printf("Received message: %.*s\n", (int)n, buf);
    } else {
        // Parent process: write to the pipe
        close(pipefd[0]); // Close the read end of the pipe

        // Write to the pipe
        const char *message = "I love you";
        ssize_t n = write(pipefd[1], message, strlen(message));
        if (n == -1) {
            perror("write");
            return 1;
        }

        // Wait for the child process to exit
        wait(NULL);
    }

    return 0;
}