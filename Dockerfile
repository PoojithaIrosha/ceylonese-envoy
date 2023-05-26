FROM tomcat:9-jdk11-openjdk

COPY ./target/CeyloneseEnvoy-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]