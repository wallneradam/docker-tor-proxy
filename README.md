# docker-tor-proxy

A small (~15 MB) docker image with Tor and Privoxy based on Alpine Linux.

It changes IP address in every minutes by default. If you want to change this behaviour, you can specify the IP_CHANGE_INTERVAL environment variable.

```
docker run -d -e IP_CHANGE_INTERVAL=120 -p 8888:8888 -p pickapp/tor-proxy
curl --proxy localhost:8888 https://www.google.com
```

And that's it!
