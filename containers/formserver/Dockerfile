FROM tomcat:9.0.62-jdk11
ENV POSTGRES_DRIVER_VERSION=42.3.5
ENV TOMCAT_SIMPLECLIENT_VERSION=0.12.0
ENV TOMCAT_EXPORTER_VERSION=0.0.15

# copy overlay directory to /
ADD ./overlay /


# download metrics exporter
RUN curl -v --fail --location https://search.maven.org/remotecontent?filepath=io/prometheus/simpleclient/${TOMCAT_SIMPLECLIENT_VERSION}/simpleclient-${TOMCAT_SIMPLECLIENT_VERSION}.jar --output /usr/local/tomcat/lib/simpleclient-${TOMCAT_SIMPLECLIENT_VERSION}.jar && \
    curl -v --fail --location https://search.maven.org/remotecontent?filepath=io/prometheus/simpleclient_common/${TOMCAT_SIMPLECLIENT_VERSION}/simpleclient_common-${TOMCAT_SIMPLECLIENT_VERSION}.jar --output /usr/local/tomcat/lib/simpleclient_common-${TOMCAT_SIMPLECLIENT_VERSION}.jar && \
    curl -v --fail --location https://search.maven.org/remotecontent?filepath=io/prometheus/simpleclient_hotspot/${TOMCAT_SIMPLECLIENT_VERSION}/simpleclient_hotspot-${TOMCAT_SIMPLECLIENT_VERSION}.jar --output /usr/local/tomcat/lib/simpleclient_hotspot-${TOMCAT_SIMPLECLIENT_VERSION}.jar && \
    curl -v --fail --location https://search.maven.org/remotecontent?filepath=io/prometheus/simpleclient_servlet/${TOMCAT_SIMPLECLIENT_VERSION}/simpleclient_servlet-${TOMCAT_SIMPLECLIENT_VERSION}.jar --output /usr/local/tomcat/lib/simpleclient_servlet-${TOMCAT_SIMPLECLIENT_VERSION}.jar && \
    curl -v --fail --location https://search.maven.org/remotecontent?filepath=io/prometheus/simpleclient_servlet_common/${TOMCAT_SIMPLECLIENT_VERSION}/simpleclient_servlet_common-${TOMCAT_SIMPLECLIENT_VERSION}.jar --output /usr/local/tomcat/lib/simpleclient_servlet_common-${TOMCAT_SIMPLECLIENT_VERSION}.jar && \
    curl -v --fail --location https://search.maven.org/remotecontent?filepath=nl/nlighten/tomcat_exporter_client/${TOMCAT_EXPORTER_VERSION}/tomcat_exporter_client-${TOMCAT_EXPORTER_VERSION}.jar --output /usr/local/tomcat/lib/tomcat_exporter_client-${TOMCAT_EXPORTER_VERSION}.jar && \
    curl -v --fail --location https://search.maven.org/remotecontent?filepath=nl/nlighten/tomcat_exporter_servlet/${TOMCAT_EXPORTER_VERSION}/tomcat_exporter_servlet-${TOMCAT_EXPORTER_VERSION}.war --output /usr/local/tomcat/webapps/metrics.war

# download postgres driver
RUN curl -v --fail https://jdbc.postgresql.org/download/postgresql-${POSTGRES_DRIVER_VERSION}.jar -o /usr/local/tomcat/lib/postgresql-${POSTGRES_DRIVER_VERSION}.jar

# Unpack formserver.war
WORKDIR /usr/local/tomcat/webapps
RUN unzip formserver.war -d formserver; rm formserver.war
CMD ["/entrypoint.sh"]
