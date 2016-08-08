#based on CentOS 7
FROM centos:7

MAINTAINER kiranmurugulla <kiran.murugulla@hotmail.com>

#Download and install Java
RUN yum update -y && \
yum install -y wget && \
wget --no-cookies --no-check-certificate \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
   "http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm" && \
yum localinstall -y jdk-8u102-linux-x64.rpm && \
rm -f jdk-8u102-linux-x64.rpm && \
yum clean all

# Set environment variables.
ENV HOME /home/root

# Define working directory.
WORKDIR /home/root
# Define default command.
CMD ["bash"]
