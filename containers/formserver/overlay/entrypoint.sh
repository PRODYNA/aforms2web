#!/bin/sh

# Replace entries in /config/resources in the server.xml which are marked with <!-- RESOURCES -->
echo "Replacing resources in server.xml"
file=/config/resources
if [ ! -f $file ]; then
  echo "Resource file $file not found"
  exit 1
fi
resources=$(cat $file)
echo "Resources -> $resources"
sed -i -e "/<!-- RESOURCES -->/{r $file
d}" /usr/local/tomcat/conf/server.xml

# Optionally rename the context from formserver to another given name
if [ $CONTEXT_RENAME_ENABLED = "true" ]; then
  echo "Renaming context from formerver to $CONTEXT_RENAME_TO"
  mv /usr/local/tomcat/webapps/formserver /usr/local/tomcat/webapps/$CONTEXT_RENAME_TO
fi

# Now start the tomcat in the foreground
echo "Starting tomcat"
catalina.sh run
