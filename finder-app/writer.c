#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <syslog.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char**argv)
{
    if(argc < 3){
        printf("One of the parameters are missing\n");
        exit(1);
    }

    openlog("filewriter", LOG_PID | LOG_CONS, LOG_USER);
    char* filepath = argv[1];
    int fd = open(filepath, O_CREAT | O_RDWR, 0640);
    if(fd == -1){
        syslog(LOG_ERR, "Failed to open file\n");
    }
    else{
        syslog(LOG_DEBUG, "Successfully opened the file: %s", filepath);
        char* write_str = argv[2];
        ssize_t bytes_written = write(fd, write_str, strlen(write_str));
        if (bytes_written == -1) {
            syslog(LOG_ERR, "Failed to write to the file\n");
            close(fd);
            return 1;
        }
        syslog(LOG_DEBUG, "Successfully wrote %ld bytes to the file", bytes_written);
        close(fd);
    }
}
