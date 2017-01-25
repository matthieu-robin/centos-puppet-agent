FROM centos:centos7
MAINTAINER matthieu-robin

# Update CentOS
RUN yum -y update
RUN yum -y install wget git

# Install puppet Agent
RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
RUN yum -y install puppet
RUN puppet resource package puppet ensure=latest

# configure puppet Agent
ADD /conf/puppet.conf /etc/puppet/puppet.conf

RUN systemctl start puppet
RUN systemctl enable puppet
