#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>

int main() {
  // Create a pipe
  int pipefd[2];
  if (pipe(pipefd) < 0) {
    perror("Error creating pipe");
    exit(1);
  }

  // Create a new process
  pid_t pid = fork();

  if (pid < 0) {
    // Print an error message and exit if the process creation failed
    perror("Error creating process");
    exit(1);
  } else if (pid == 0) {
    // Child process: read from the pipe and print the message

    // Close the write end of the pipe
    close(pipefd[1]);

    // Read from the pipe
    char message[1024];
    if (read(pipefd[0], message, sizeof(message)) < 0) {
      perror("Error reading from pipe");
      exit(1);
    }

    // Print the message to standard output
    printf("%s\n", message);

    // Close the read end of the pipe
    close(pipefd[0]);
  } else {
    // Parent process: write to the pipe

    // Close the read end of the pipe
    close(pipefd[0]);

    // Write to the pipe
    const char* message = "I love you";
    if (write(pipefd[1], message, strlen(message)) < 0) {
      perror("Error writing to pipe");
      exit(1);
    }

    // Close the write end of the pipe
    close(pipefd[1]);

    // Wait for the child process to terminate
    int status;
    waitpid(pid, &status, 0);
  }

  return 0;
}