FROM ubuntu:trusty
MAINTAINER elizandro@nexthop.net.br


WORKDIR /etc/unbound/

RUN apt-get update && apt-get install -y \
	dnsutils \
	htop \
	wget \
	unbound 

ADD assets/unbound.conf /etc/unbound/unbound.conf
RUN rm -fr /etc/unbound/conf.d
RUN chown -R unbound:unbound /etc/unbound/

USER unbound
RUN unbound-anchor -a /etc/unbound/root.key ; true
RUN unbound-control-setup 
RUN wget ftp://FTP.INTERNIC.NET/domain/named.cache -O /etc/unbound/root.hints

USER root
RUN /etc/init.d/unbound restart

EXPOSE 53/udp
EXPOSE 53

#CMD ["/etc/init.d/unbound", "restart"]
ENTRYPOINT /etc/init.d/unbound restart && bash
