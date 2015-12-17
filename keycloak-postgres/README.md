# keycloak-postgres image

This image is almost the same as the original jboss/keycloak-postgres image except that it enables https proxying.



## configuration

See also the 

```bash
docker run --name ivonet-keycloak --link ivonet-keycloak-postgres:postgres -p 11000:8080 -e POSTGRES_DATABASE=keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD="S3cr3t" ivonet/keycloak-postgres
```


```A
<VirtualHost *:80>
    ServerName security.example.com
   <Location />
      RedirectPermanent / https://security.ivonet.it/
   </Location>
</VirtualHost>
<VirtualHost *:443>
    ServerName security.example.com
    
    SSLEngine on
    SSLProtocol all -SSLv2
    SSLCipherSuite ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM
    
    # See letsencrypt.org for more information on this part of the config
    SSLCertificateFile /etc/letsencrypt/live/security.example.com/cert.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/security.example.com/privkey.pem
    SSLCertificateChainFile /etc/letsencrypt/live/security.example.com/chain.pem
    
    CustomLog /var/log/apache2/ssl_request_log "%t %h %{SSL_PROTOCOL}x %{SSL_CIPHER}x \"%r\" %b"

    ProxyRequests Off
    ProxyPass / http://172.17.0.1:11000/
    ProxyPassReverse / http://172.17.0.1:11000/
    ProxyPreserveHost On

    RequestHeader set X-Forwarded-For "https"
    RequestHeader set X-Forwarded-Proto "https"

    <Location />
        Order deny,allow
        Allow from all
        SSLRequireSSL
    </Location>

    LogLevel info
    ErrorLog /var/log/apache2/keycloak-error.log
    CustomLog /var/log/apache2/keycloak-access.log combined
</VirtualHost>
```