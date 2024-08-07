#/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script startted executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e"$2.....$R failed $N"
       exit 1
    else
        echo -e "$2....$G sucess $N"

    fi
}
 
if [ $ID -ne 0 ]
then
    echo -e "$R error:: please run the script with root acess $N"
exit 1
else
     echo " you are root acess"
fi

cp mongo.repo /etc/yum.repos.d/mongo.repo &>> $LOGFILE
  
  VALIDATE $? "copied  MongoDB Repo"

