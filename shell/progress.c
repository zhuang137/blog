#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
void getWinWidth(int* width) {
    FILE* read_fp = NULL;
    int chars_read = 0;
    char buffer[5];
    char* shell="tput cols\0";
    memset(buffer,'\0',sizeof(buffer));
    read_fp=popen("tput cols","r");
    
    if(read_fp) {
        chars_read = fread(buffer,sizeof(char),5,read_fp);
        if (chars_read>0) {
            *width = atol(buffer);
            //printf("%s",buffer);
        }
    }
    pclose(read_fp);
}

void show_progress(unsigned progress,unsigned int sleep_time,unsigned win_width) {
    if (progress>100) return;
    const int size = 102;
    char array[size];
    char flag[] = "~/|\\";
    memset(array,'\0',size);
    for(int n=0;n<progress;n++){
        array[n]='=';
    }
    if(win_width >= 100){
        printf("[%-85s] [%d%%][%c]\r",array,progress,flag[progress%4]);
    } else if (win_width >=70) {
        if(progress >= 70) {array[69]='\0';}
        printf("[%-62s] [%d%%][%c]\r",array,progress,flag[progress%4]);
    } else {
        printf("[%d%%][%c]\r",progress,flag[progress%4]);
    }
    fflush(stdout);
    usleep(sleep_time);
}
int main(int argc,char* argv[]){
    int progress = 0;
    int win_width = 0;
    getWinWidth(&win_width);
    if(win_width==0){
        printf("failed to get console cols");
        return -1;
    }
    while (progress<101){
        show_progress(progress,0,win_width);
        progress++;
        usleep(100000);
    }
    printf("\n");
    return 0;
}
