#based on CentOS 7
FROM centos:7

MAINTAINER kiranmurugulla <kiran.murugulla@hotmail.com>
#Install wget
RUN yum update -y && \
yum install -y wget 
#Download , install Java 8 and configure Java using alternatives to have multiple version of java at later point
RUN cd /opt && \
wget --no-cookies --no-check-certificate \
 --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
 "http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz" && \
tar -xzf jdk-8u77-linux-x64.tar.gz && \
cd /opt/jdk1.8.0_77 && \
alternatives --install /usr/bin/java java /opt/jdk1.8.0_77/bin/java 2 && \
echo | alternatives --config java && \
alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_77/bin/jar 2 && \
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_77/bin/javac 2 && \
alternatives --set jar /opt/jdk1.8.0_77/bin/jar && \
alternatives --set javac /opt/jdk1.8.0_77/bin/javac
# Set environment variables.
ENV HOME /home/root
ENV JAVA_HOME /opt/jdk1.8.0_77
ENV JRE_HOME /opt/jdk1.8.0_77/jre
ENV PATH  /usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/jdk1.8.0_77/bin:/opt/jdk1.8.0_77/jre/bin
# Define working directory.
WORKDIR /home/root
# Define default command.
CMD ["bash"]
