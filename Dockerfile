FROM tireintel/apache-php:4.0
MAINTAINER Hemerson Varela "hemerson.varela@tire-intelligence.com"

# Define environment variables
ENV APP_NAME ZendSkeletonApplication
ENV APP_PATH /releases/$APP_NAME

# Add APP into container
ADD src $APP_PATH

# Add virtual hosts
RUN echo 'NameVirtualHost *:80' >> /etc/httpd/conf/httpd.conf
ADD vhost/ /etc/httpd/conf.d

EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]