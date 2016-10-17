#!/bin/sh

_trap() {
    local pid=1
    for p in /opt/*/; do
        service=`basename "$p"`
        eval "pid=\${pid${service}}"
        echo "Killing service: ${service} (${pid})..."
        kill ${pid} 2>/dev/null
    done
}

trap _trap SIGTERM SIGINT

for p in /opt/*/; do
    service=`basename "$p"`
    echo "Starting service: $service..."
    cd "$p"
    /bin/sh ./run &

    lastPid=$!
    eval "pid${service}=${lastPid}"
done

# Wait for all services to exit
for p in /opt/*/; do
    service=`basename "$p"`
    pid=1
    eval "pid=\${pid${service}}"
    echo "Waiting for service to exit: ${service} (${pid})"
    wait ${pid}
done
