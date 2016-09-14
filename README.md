# docker-tor-proxy

A small (~15 MB) docker image with Tor and Privoxy based on Alpine Linux.

```
docker run -d -p 8888:8888 -p pickapp/tor-proxy
curl --proxy localhost:8888 https://www.google.com
```

And that's it!
