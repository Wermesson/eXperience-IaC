FROM centos:centos7

ENV ORACLE_HOME /usr/lib/oracle/12.2/client64
ENV LD_LIBRARY_PATH $ORACLE_HOME/lib

RUN chmod a+x /usr/bin/systemctl && \
yum update -y && \
yum install -y epel-release && \
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
yum install -y php56w php56w-opcache php56-php-pdo wget gcc \
php56-fpm php56w-mysql httpd php56-gd php56-pear php56w-pear \
php56-mbstring php56-mbstring php56-mcrypt php56w-pecl-redis \
curl vim samba samba-client samba-common make && \
yum install -y centos-release-scl && \
yum install -y httpd24-httpd && \
yum install -y libaio && \
yum clean all && \
touch /etc/httpd/conf.d/php56.conf && \
echo "LoadModule php5_module /usr/lib64/httpd/modules/libphp5.so" > /etc/httpd/conf.d/php56.conf \
    && echo "" >> /etc/httpd/conf.d/php56.conf \
    && echo "<FilesMatch \.php$>" >> /etc/httpd/conf.d/php56.conf \
    && echo "    SetHandler application/x-httpd-php" >> /etc/httpd/conf.d/php56.conf \
    && echo "</FilesMatch>" >> /etc/httpd/conf.d/php56.conf && \
    mkdir /opt/oracle && \
    curl -o /opt/oracle/instantclient-basic.rpm https://codemed.com.br/site/arquivos/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm -L -C - && \
    curl -o /opt/oracle/instantclient-devel.rpm https://codemed.com.br/site/arquivos/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm -L -C - && \
    curl -o /opt/oracle/instantclient-sqlplus.rpm https://codemed.com.br/site/arquivos/oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm -L -C - && \
    rpm -ivh /opt/oracle/instantclient-basic.rpm && \
    rpm -ivh /opt/oracle/instantclient-devel.rpm && \
    rpm -ivh /opt/oracle/instantclient-sqlplus.rpm && \
    rm -f /opt/oracle/*.rpm

COPY /experience /var/www/html/experience

RUN chmod a+x /var/www/html/experience/run.sh
RUN /var/www/html/experience/run.sh

EXPOSE 8080

ENTRYPOINT ["/usr/sbin/init"]