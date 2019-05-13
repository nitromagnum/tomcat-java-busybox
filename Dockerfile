FROM ubuntu:16.04
RUN apt-get update && apt-get install -y \
  tomcat8 \
  maven \
  openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV CATALINA_BASE /usr/local/tomcat
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello && cd boxfuse-sample-java-war-hello/ && mvn package && cp target/hello-1.0.war /var/lib/tomcat8/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

