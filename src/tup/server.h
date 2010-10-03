#ifndef server_h
#define server_h

#include "access_event.h"
#include "compat.h"
#include "file.h"
#include <pthread.h>

struct server {
	int sd[2];
	int lockfd;
	pthread_t tid;
	struct file_info finfo;
	char file1[PATH_MAX];
	char file2[PATH_MAX];
	int exited;
	int signalled;
	int exit_status;
	int exit_sig;
};

int server_init(void);
int server_exec(struct server *s, int vardict_fd, int dfd, const char *cmd);
int server_is_dead(void);

#endif
