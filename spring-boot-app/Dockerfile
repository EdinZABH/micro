FROM ubuntu
ENV MAVEN_VERSION 3.3.3
ENV MAVEN_HOME /usr/share/maven
ENV JAVA_HOME /jdk1.8.0_201
RUN apt-get update -y && apt-get install curl -y && curl -sSLO \
    -H "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz && \
    tar -xzf jdk-8u201-linux-x64.tar.gz && ln -s /jdk1.8.0_201/bin/java /usr/bin/java && mkdir /app && curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
       | tar xzf - -C /usr/share && \
    mv /usr/share/apache-maven-${MAVEN_VERSION} $MAVEN_HOME && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn 
WORKDIR /app
COPY . .
RUN mvn clean package
CMD ["java", "-jar",  "/app/target/spring-boot-app-1.0-SNAPSHOT.jar", "--spring.config.location=/app/src/main/resources/application.yml"]
