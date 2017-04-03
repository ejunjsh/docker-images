FROM ubuntu:14.04

MAINTAINER ejunjsh <sjj050121014@163.com>

WORKDIR /root

# install openssh-server, mysql-server
RUN apt-get update && apt-get install -y openssh-server vim mysql-server
RUN /etc/init.d/mysql start \
    && mysql -uroot -e "grant all privileges on *.* to 'root'@'%' identified by 'wapwap12';" \
    && mysql -uroot -e "grant all privileges on *.* to 'root'@'localhost' identified by 'wapwap12';" 

RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf \
    && echo 'skip-host-cache\nskip-name-resolve' | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/mysql/my.cnf > /tmp/my.cnf \
    && mv /tmp/my.cnf /etc/mysql/my.cnf

EXPOSE 3306  
CMD ["/usr/bin/mysqld_safe"]
