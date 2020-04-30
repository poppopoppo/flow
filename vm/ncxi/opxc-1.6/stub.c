#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/mman.h>

void* alc_gd_buf(int* ps){
	int pagesize = sysconf(_SC_PAGE_SIZE);
	if (pagesize == -1){ return NULL; }

	char* buffer = memalign(pagesize, 2 * pagesize);
	if (buffer == NULL){
		return NULL; }

	if (mprotect(buffer + pagesize, pagesize,
							 PROT_NONE) == -1){ 
		return NULL;
							 }
		*ps = pagesize; 
		return buffer;
}
int set_handler(int n,void* f){
	struct sigaction a;
	a.sa_flags = SA_SIGINFO;
	a.sa_sigaction = f;
	sigemptyset(&a.sa_mask);
	return sigaction(n,&a,NULL);
	};

int emt_s8_to(char* fn,void* buf,int n){
	int fd = creat(fn,S_IREAD | S_IWRITE);
	int r =	write(fd,buf,n);
	close(fd);
	return r;
}


