#include<fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  // Check if the required number of arguments was provided
  if (argc < 3) {
    fprintf(stderr, "Error: Invalid number of arguments.\n");
    fprintf(stderr, "Usage: compare file1 file2\n");
    exit(1);
  }

  // Create a new process
  pid_t pid = fork();

  if (pid < 0) {
    // Print an error message and exit if the process creation failed
    perror("Error creating process");
    exit(1);
  } else if (pid == 0) {
    // Child process: execute the `cmp` command

    // Redirect the output of the command to /dev/null
    int null = open("/dev/null", O_WRONLY);
    if (null < 0) {
      perror("Error redirecting output");
      exit(1);
    }
    if (dup2(null, STDOUT_FILENO) < 0) {
      perror("Error redirecting output");
      exit(1);
    }

    // Execute the `cmp` command
    execlp("cmp", "cmp", argv[1], argv[2], (char *)NULL);
    perror("Error executing cmp");
    exit(1);
  } else {
    // Parent process: wait for the child process to terminate
    int status;
    waitpid(pid, &status, 0);

    // Print the exit status of the `cmp` command
    printf("Exit status: %d\n", WEXITSTATUS(status));
  }

  return 0;
}