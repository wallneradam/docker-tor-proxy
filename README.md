# docker-tor-proxy

A docker image with Tor and Privoxy based on Alpine Linux. Now it has Squid as well for caching and midifying requests.

It changes IP address in every minutes by default. If you want to change this behaviour, you can specify the IP_CHANGE_INTERVAL environment variable.

```
docker run -d -e IP_CHANGE_INTERVAL=120 -p 8888:8888 -p pickapp/tor-proxy
curl --proxy localhost:8888 http://ipecho.net/
```

And that's it!

## Squid settings

You can change squid settings by mount a custom.conf into /opt/squid/custom.conf:
```
docker run -d -e IP_CHANGE_INTERVAL=120 -v $PWD/custom.conf:/opt/squid/custom.conf -p 8888:8888 -p pickapp/tor-proxy
```

The image has an URL rewrite script to be able to modify request URLs. You can configure it by mounting a file into /opt/squid/rewriter.conf like this:
```
# URL rewriter: change in the server, not in the browser
SED="$SED;s|^http://\(.*google\)\.hu|\1.com|g"

# URL redirect in the browser with HTTP status code 302
SED="$SED;s|^http://\(.*google\)\.com|302:\1.hu|g"
```
