#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <fcntl.h>

int main() {
  // Create a new process
  pid_t pid = fork();

  if (pid < 0) {
    // Print an error message and exit if the process creation failed
    perror("Error creating process");
    exit(1);
  } else if (pid == 0) {
    // Child process: create an empty file called 'abc'
    int fd = open("abc", O_CREAT | O_WRONLY, 0666);
    if (fd < 0) {
      // Print an error message and exit if the file creation failed
      perror("Error creating file");
      exit(1);
    }
    close(fd);
  } else {
    // Parent process: wait for the child process to terminate
    int status;
    waitpid(pid, &status, 0);
    printf("Child process terminated with process number %d\n", pid);
  }

  return 0;
}
