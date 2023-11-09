FROM rockylinux:9
WORKDIR app
RUN dnf -y install gcc && dnf clean all
COPY . .
RUN chmod a+x ./stream.sh
CMD ["/app/stream.sh"]