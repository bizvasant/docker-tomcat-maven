FROM tomcat:latest

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8083

CMD ["catalina.sh", "run"]
