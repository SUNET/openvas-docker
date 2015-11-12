FROM ubuntu:trusty

MAINTAINER openvas-dev <mailing-list_to_be_created>

VOLUME ["/opt/openvas"]

ADD setup.sh /opt/openvas/
ADD run.sh /opt/openvas/
ADD ppakey.pub /opt/openvas/

RUN /opt/openvas/setup.sh

ENTRYPOINT ["/opt/openvas/run.sh"]

WORKDIR /
