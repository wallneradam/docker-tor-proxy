# docker-tor-proxy

A docker image with Tor and Privoxy based on Alpine Linux. Now it has Squid as well for caching requests.

It changes IP address in every minutes by default. If you want to change this behaviour, you can specify the IP_CHANGE_INTERVAL environment variable.

```
docker run -d -e IP_CHANGE_INTERVAL=120 -p 8888:8888 -p pickapp/tor-proxy
curl --proxy localhost:8888 http://ipecho.net/
```

And that's it!
