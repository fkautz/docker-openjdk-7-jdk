# OpenJDK 7 JDK

FROM fkautz/openjdk-7-jre
MAINTAINER Frederick F. Kautz IV "fkautz@alumni.cmu.edu"

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg-divert --local --rename --add /sbin/initctl && ln -s /bin/true /sbin/initctl

RUN apt-get -y install fuse  || :
RUN rm -rf /var/lib/dpkg/info/fuse.postinst
RUN apt-get -y install fuse

RUN apt-get update
RUN apt-get -y install openjdk-7-jdk && apt-get clean
