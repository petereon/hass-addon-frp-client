#!/usr/bin/env bashio
WAIT_PIDS=()
CONFIG_PATH=$(bashio::config 'config_path')

function stop_frpc() {
	bashio::log.info "Shutdown frpc client"
	kill -15 "${WAIT_PIDS[@]}"
}

if [ ! -f "$CONFIG_PATH" ]; then
	bashio::log.error "Configuration file not found at: $CONFIG_PATH"
	exit 1
fi

bashio::log.info "Using configuration file: $CONFIG_PATH"
bashio::log.info "Starting frp client"

cat "$CONFIG_PATH"

cd /usr/src || exit
./frpc -c "$CONFIG_PATH" &
WAIT_PIDS+=($!)

tail -f /share/frpc.log &

trap "stop_frpc" SIGTERM SIGHUP
wait "${WAIT_PIDS[@]}"
