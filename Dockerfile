FROM tomcat:latest
RUN apt-get update && apt-get install -y \
  maven \
  git \
  openjdk-8-jdk
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello \
  && cd boxfuse-sample-java-war-hello/ \
  && mvn package \
  && cp target/hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
