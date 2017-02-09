FROM centos:centos7
MAINTAINER matthieu-robin

# Update CentOS
RUN yum -y update
RUN yum -y install wget

# Install puppet Agent
RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
RUN yum -y install puppet

# configure puppet Agent
ADD /conf/puppet.conf /etc/puppet/puppet.conf

# install and configure apache for test purpose
RUN yum -y install httpd
ADD /conf/meetup.gif /var/www/html/
ADD /conf/index.html /var/www/html/

#Start services and run scripts
ADD /scripts/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh
CMD ["/tmp/script.sh"]

EXPOSE 80
