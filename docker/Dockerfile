FROM      ubuntu:trusty
MAINTAINER Will Ware <wware@alum.mit.edu>

RUN apt-get update
RUN apt-get install -y vim git build-essential wget
# RUN apt-get install -y apache2 php5 libapache2-mod-php5

ADD image /
RUN /prep.sh
RUN rm -f /prep.sh

# CMD /usr/sbin/apache2ctl -D FOREGROUND
CMD /bin/bash