#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

int main() {
  // Create a new process
  pid_t pid = fork();

  if (pid < 0) {
    // Print an error message and exit if the process creation failed
    perror("Error creating process");
    exit(1);
  } else if (pid == 0) {
    // Child process: find the sum of even numbers

    int sum = 0;
    for (int i = 2; i <= 100; i += 2) {
      sum += i;
    }
    printf("Sum of even numbers: %d\n", sum);
  } else {
    // Parent process: find the sum of odd numbers

    int sum = 0;
    for (int i = 1; i <= 100; i += 2) {
      sum += i;
    }
    printf("Sum of odd numbers: %d\n", sum);
  }

  return 0;
}