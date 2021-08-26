FROM alpine:3.2
COPY ./jdk-8u251-linux-x64.tar.gz /opt/app/
RUN tar -xvzf /opt/app/jdk-8u251-linux-x64.tar.gz
RUN ./configure

# # Install cURL
RUN apk --update add curl ca-certificates tar


# # Java Version
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 45
ENV JAVA_VERSION_BUILD 14
ENV JAVA_PACKAGE       jdk

# # Download and unarchive Java
RUN mkdir -p /opt/app/
RUN cd /opt/app

# # Install cURL
RUN apk --update add curl ca-certificates tar && \
curl -Ls https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk > /tmp/glibc-2.21-r2.apk && \
    apk add --allow-untrusted /tmp/glibc-2.21-r2.apk

# # Set environment
ENV JAVA_HOME /opt/app
ENV PATH ${PATH}:${JAVA_HOME}/bin
