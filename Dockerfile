FROM maven:3.8.4-eclipse-temurin-17 AS build
RUN mkdir /app
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat:latest
COPY --from=build /app/webapp/target/webapp.war /usr/local/tomcat/webapps/webapp.war
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps




# FROM tomcat:latest
# RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
# COPY /webapp/target/*.war /usr/local/tomcat/webapps



# FROM ubuntu:latest as builder
# RUN apt-get update && \
#     apt-get install -y openjdk-8-jdk wget unzip

# ARG MAVEN_VERSION=3.9.6
# RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz && \
#     tar -zxvf apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
#     rm apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
#     mv apache-maven-${MAVEN_VERSION} /usr/lib/maven

# ENV MAVEN_HOME /usr/lib/maven
# ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
# ENV PATH=$MAVEN_HOME/bin:$PATH
# RUN mkdir -p /app
# COPY . /app
# WORKDIR /app
# RUN mvn install


# FROM tomcat:latest
# COPY --from=builder /app/webapp/target/webapp.war /usr/local/tomcat/webapps/webapp.war
# RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
