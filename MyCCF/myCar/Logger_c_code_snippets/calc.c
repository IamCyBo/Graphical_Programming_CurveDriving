// Use this file to implement the method body in C.
FILE *fp;
fp = fopen("c:\\ascet-tmp\\log.txt","a");
fprintf(fp,"%f\t%f\t%f\t%f\t\n",t,x,y,z);
fclose(fp);
