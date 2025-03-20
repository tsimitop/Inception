FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y nginx openssl curl && apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN	mkdir -p /etc/nginx/ssl /var/www/html && \
# 	openssl req \
# 	-x509 \
# 	-nodes \
# 	-out /etc/nginx/ssl/inception.crt \
# 	-keyout /etc/nginx/ssl/inception.key \
# 	-subj "/C=DE/ST=Baden-Wuttemberg/L=Heilbronn/O=Anonymous.inc/OU=supersecret/CN=tsimitop.42.fr"

# RUN mkdir -p /usr/local/share/pk_certificates
# RUN cp /etc/nginx/ssl/inception.crt /usr/local/share/pk_certificates/inception.crt
# RUN cp /etc/nginx/ssl/inception.key /usr/local/share/pk_certificates/inception.key

COPY conf/nginx.conf /etc/nginx/sites-available/default

# EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

