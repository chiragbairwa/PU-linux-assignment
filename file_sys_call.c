#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main() {
  // Open the file 'example.txt' for reading
  int fd = open("example.txt", O_RDONLY);
  if (fd < 0) {
    perror("Error opening file");
    return 1;
  }

  // Read from the file using the file descriptor
  // ...

  // Close the file descriptor
  close(fd);

  return 0;
}