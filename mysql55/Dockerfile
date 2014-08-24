# MySQL 5.5

FROM zanco/ubuntu1404-ssh

# Basic utilities
RUN apt-get install -y software-properties-common python-software-properties

# Add mysql 5.5 PPA
RUN add-apt-repository -y ppa:ondrej/mysql-5.5
RUN apt-get update


# Install mysql
RUN apt-get install -y mysql-server

# Copy files necessary for supervisor
ADD mysql.sv.conf /etc/supervisor/conf.d/mysql.sv.conf
ADD supervised_mysql /usr/sbin/supervised_mysql
RUN chmod +x /usr/sbin/supervised_mysql

# tell mysql to listen on all interfaces
# bind-address            = 127.0.0.1
RUN  sed -i -e 's#127.0.0.1#0.0.0.0#' /etc/mysql/my.cnf

# Expose mysql port
EXPOSE 3306

