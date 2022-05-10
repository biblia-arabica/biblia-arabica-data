# Specify the eXist-db release as a base image
FROM duncdrum/existdb:6.0.1-nonroot

# Exist autodeploy directory
ENV autodeploy=/exist/autodeploy

# Grab remote .xar files and put them in autodeploy
ADD http://exist-db.org/exist/apps/public-repo/public/expath-crypto-exist-lib-0.6.xar ${autodeploy}

# Copy built eXist package to autodeploy 
COPY build/*.xar ${autodeploy}

# OPTIONAL: Copy custom conf.xml to WEB-INF.
# COPY conf/conf.xml /exist/etc

#EXPOSE 8080 8443
EXPOSE 8080 8443

# Start eXist-db
CMD [ "java", "-jar", "start.jar", "jetty" ]

LABEL org.opencontainers.image.source=https://github.com/biblia-arabica/biblia-arabica-data