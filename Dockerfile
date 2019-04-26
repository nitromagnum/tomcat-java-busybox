FROM ubuntu:16.04
RUN apt-get update && apt-get install -y \
  tomcat8\
  maven \
  git \
  wget 
RUN wget -O java.tar.gz https://javadl.oracle.com/webapps/download/AutoDL?BundleId=238719_478a62b7d4e34b78b671c754eaaf38ab
RUN mkdir -p /usr/lib/jvm/ && tar zxvf java.tar.gz -C /usr/lib/jvm/
RUN export JAVA_HOME=/usr/lib/jvm/jre1.8.0_211/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello && cd boxfuse-sample-java-war-hello/ && mvn package && cp target/hello-1.0.war /var/lib/tomcat8/webapps/
EXPOSE 8080
CMD ["tomcat8", "-g", "daemon off;"]

