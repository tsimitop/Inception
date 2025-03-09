# some Debian
FROM 

# update VMs resources (ie.apk), add basic utilities (vim , curl, sudo etc.)
RUN apt-get update && apt-get install -y nginx openssl && apt-get clean && rm -rf /var/lib/apt/lists/*
#rm -rf /var/lib/apt/lists/*: removes cached package lists to keep the image small, do not upgrade, extra space and possible mismatches
# apt-get clean -> Deletes all cached package files.
# apt-get autoclean -> Deletes only outdated package files that can no longer be downloaded.

# establish safe tls 2 and 3 connection
RUN 
# X.509 is a standard format for public key certificates used in SSL/TLS for websites, email encryption, and authentication.
# It contains the public key, issuer information, validity period, and a digital signature.
# This command creates a self-signed certificate, meaning:
# 	->It is not issued by a Certificate Authority (CA).
# 	->It is commonly used for testing, local servers, and internal applications.
# 	->It is valid only for a set period (default: 365 days, can be modified with -days <num>).
# Example: openssl req -x509 -newkey rsa:2048 -keyout mykey.pem -out mycert.pem -days 365
# -x509 → Generates an X.509 certificate.
# -newkey rsa:2048 → Creates a new 2048-bit RSA key (can be 4096 for more security).
# -keyout mykey.pem → Saves the private key.
# -out mycert.pem → Saves the self-signed certificate.
# -days 365 → Makes the certificate valid for 1 year.

# The -subj option in openssl req -x509 sets the certificate subject (Distinguished Name, or DN) directly in the command line, avoiding the interactive prompts.
# -subj "/C=US/ST=California/L=Los Angeles/O=My Company/OU=IT/CN=example.com"
# /C=US → Country (US = United States)
# /ST=California → State/Province
# /L=Los Angeles → City/Locality
# /O=My Company → Organization Name
# /OU=IT → Organizational Unit
# /CN=example.com → Common Name (CN) (typically the domain name)
# 	-> Automates certificate creation (useful for scripts, Docker, automation).
# 	-> Avoids manual input prompts during OpenSSL execution.
# 	-> Ensures consistency in certificate details.
# file_to_copy where_to_copy

# BUT
# with the -nodes option , our private key will simply be left without a password.

# where you want to store the certificate and key for our SSL by adding the -out and -keyout options.
#    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key

# mkdir /etc/nginx/ssl to store the NGINX config files


# get the proper default file abd cioy in vm
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /wherever/www/html (for main root)
RUN chown -R www-data:www-data /wherever/www/html (for main user)

# the container is listening on the specified network ports at runtime.It does not make container ports accessible to the host.
EXPOSE 443

# start NGINX in the foreground, container doesn't stop
CMD ["nginx", "-g", "daemon off;"]

# launch a certain command when the container is launched.
ENTRYPOINT 