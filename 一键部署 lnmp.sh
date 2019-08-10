#!/bin/bash
#一键安装lnmp软件
menu(){
echo  "##############---Menu---##############"
echo  "#1.lnstall  Nginx"
echo  "#2.Exit  Program"
echo  "######################################"
 }
echoice(){
     read  -p "Please   choice  a  menu [1-9]:" select
}


install_nginx(){
   id  nginx &>/dev/null
    if [ $? -ne 0 ]; then
          useradd -s  /sbin/nologin  nginx
    fi
     if [ -f nginx-1.12.2.tar.gz ];then           #检测nginx文件,必要时更改版本>号
      yum  -y  install    php   php-fpm  php-devel    msyql   msyql-devel  msyql-server   gcc   openssl-devel  perc-devel
        tar  -zvxf  nginx-1.12.2.tar.gz
    cd  nginx-1.12.2
       \./configure --with-http_ssl_module
       make   &&   make  install
       cd ..
      ln -s  /usr/loacl/nginx/sbin/nginx   /sbin/     #创建快捷方式
     else
         echo  "没有nginx源码包"
    fi
}
while : 
do
   menu
   echoice
   case $select  in
1)
    install_nginx
    ;;
2)
    exit
    ;;
*)
    echo   Sorry!
 esac
done


