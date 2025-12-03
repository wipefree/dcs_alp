FROM alpine:3.18

# make update and with cache OFF installing Java and net-tools
RUN apk update && apk add --no-cache openjdk11-jre net-tools

# get Tomcat archiv and copy contained to workdir tomcat9, remove archiv and clean apk cache
RUN cd /tmp && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz && \
    tar -xzf apache-tomcat-9.0.85.tar.gz && \
    rm -f /tmp/apache-tomcat-9.0.85.tar.gz && \
    mv apache-tomcat-9.0.85 /opt/tomcat9 && \
    rm -rf /var/cache/apk/*
    #apk cache clean

# run Tomcat on 8080 port
EXPOSE 8080
CMD ["/opt/tomcat9/bin/catalina.sh", "run"]
