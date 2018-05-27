FROM scratch

LABEL author="alan.ma@umusic.com" 
LABEL version="1.0"
LABEL description="This is the smallest docker image \
that can run a GO binary."

ADD ./bin/appserver /appserver
ENV PORT 8080
EXPOSE 8080
# ENTRYPOINT [“/appserver]
CMD ["/appserver"]

