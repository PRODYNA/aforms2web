FROM tomcat:9.0.62-jdk11

# copy overlay directory to /
ADD ./overlay /

WORKDIR /usr/local/tomcat/webapps
RUN unzip formserver.war -d formserver; rm formserver.war
CMD ["/entrypoint.sh"]

