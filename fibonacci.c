#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  // Check if the required number of arguments was provided
  if (argc < 2) {
    fprintf(stderr, "Error: No number of terms provided.\n");
    fprintf(stderr, "Usage: fibonacci n\n");
    exit(1);
  }

  // Parse the number of terms from the command line argument
  int n = atoi(argv[1]);

  // Create a new process
  pid_t pid = fork();

  if (pid < 0) {
    // Print an error message and exit if the process creation failed
    perror("Error creating process");
    exit(1);
  } else if (pid == 0) {
    // Child process: generate the Fibonacci series

    // Initialize the first two terms of the series
    int a = 0;
    int b = 1;

    // Print the first term
    printf("%d ", a);

    // Generate and print the remaining terms of the series
    for (int i = 1; i < n; i++) {
      int c = a + b;
      printf("%d ", c);
      a = b;
      b = c;
    }
    printf("\n");
  } else {
    // Parent process: wait for the child process to terminate
    int status;
    waitpid(pid, &status, 0);
  }

  return 0;
}
