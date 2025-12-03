FROM ubuntu:20.04
MAINTAINER 'Andre'

RUN apt update && apt install -y net-tools

#*** installing needed software
RUN apt install -y default-jdk && \
    apt install -y maven && \
    apt install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#*** clon project and build WAR
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
#*** building WAR place: /boxfuse-sample-java-war-hello/target/hello-1.0.war
