#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  // Check if at least one argument was provided
  if (argc < 2) {
    fprintf(stderr, "Error: No command provided.\n");
    exit(1);
  }

  // Create pipes for the command output and `sort` input
  int pipe1[2];
  int pipe2[2];
  if (pipe(pipe1) < 0 || pipe(pipe2) < 0) {
    perror("Error creating pipes");
    exit(1);
  }

  // Create a new process
  pid_t pid = fork();

  if (pid < 0) {
    // Print an error message and exit if the process creation failed
    perror("Error creating process");
    exit(1);
  } else if (pid == 0) {
    // Child process: execute `sort`

    // Close the unused ends of the pipes
    close(pipe1[1]);
    close(pipe2[0]);

    // Redirect the input and output of `sort`
    if (dup2(pipe1[0], STDIN_FILENO) < 0 || dup2(pipe2[1], STDOUT_FILENO) < 0) {
      perror("Error redirecting output");
      exit(1);
    }

    // Execute `sort`
    execlp("sort", "sort", (char *)NULL);
    perror("Error executing sort");
    exit(1);
  } else {
    // Parent process: execute the command

    // Close the unused ends of the pipes
    close(pipe1[0]);
    close(pipe2[1]);

    // Redirect the output of the command to the input of `sort`
    if (dup2(pipe1[1], STDOUT_FILENO) < 0) {
      perror("Error redirecting output");
      exit(1);
    }

    // Execute the command
    execvp(argv[1], argv + 1);
    perror("Error executing command");
    exit(1);
  }

  return 0;
}
