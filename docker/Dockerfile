FROM      ubuntu:trusty
MAINTAINER Will Ware <wware@alum.mit.edu>

ADD image /
RUN /prep.sh
RUN rm -f /prep.sh

# CMD /usr/sbin/apache2ctl -D FOREGROUND
