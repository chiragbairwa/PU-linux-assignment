#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
  // Check if the required number of arguments was provided
  if (argc < 3) {
    fprintf(stderr, "Error: Invalid number of arguments.\n");
    fprintf(stderr, "Usage: cp source destination\n");
    exit(1);
  }

  // Open the source file for reading
  int src_fd = open(argv[1], O_RDONLY);
  if (src_fd < 0) {
    perror("Error opening source file");
    exit(1);
  }

  // Open the destination file for writing
  int dest_fd = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0644);
  if (dest_fd < 0) {
    perror("Error opening destination file");
    exit(1);
  }

  // Copy the contents of the source file to the destination file
  char buffer[1024];
  ssize_t bytes_read;
  while ((bytes_read = read(src_fd, buffer, sizeof(buffer))) > 0) {
    ssize_t bytes_written = write(dest_fd, buffer, bytes_read);
    if (bytes_written != bytes_read) {
      fprintf(stderr, "Error copying file\n");
      exit(1);
    }
  }

  // Check for errors while reading the source file
  if (bytes_read < 0) {
    perror("Error reading source file");
    exit(1);
  }

  // Close the file descriptors
  close(src_fd);
  close(dest_fd);

  return 0;
}
