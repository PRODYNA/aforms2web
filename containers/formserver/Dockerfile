FROM tomcat:9.0.62-jdk11
ENV POSTGRES_DRIVER_VERSION=42.3.5

# copy overlay directory to /
ADD ./overlay /

RUN curl -v --fail https://jdbc.postgresql.org/download/postgresql-${POSTGRES_DRIVER_VERSION}.jar -o /usr/local/tomcat/lib/postgresql-${POSTGRES_DRIVER_VERSION}.jar

WORKDIR /usr/local/tomcat/webapps
RUN unzip formserver.war -d formserver; rm formserver.war
CMD ["/entrypoint.sh"]
