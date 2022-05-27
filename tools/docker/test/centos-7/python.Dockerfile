FROM centos:7

RUN yum -y update \
&& yum -y groupinstall 'Development Tools' \
&& yum clean all \
&& rm -rf /var/cache/yum

# Install Python
RUN yum -y update \
&& yum -y install python3 python3-devel python3-pip numpy \
&& yum clean all \
&& rm -rf /var/cache/yum

WORKDIR /root
ADD or-tools_amd64_centos-7_python_v*.tar.gz .

RUN cd or-tools_*_v* && make test
