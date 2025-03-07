#!/usr/bin/with-contenv bashio
# vim: ft=bash
# shellcheck shell=bash
# ==============================================================================
# Runs homeassistant_truma_service
# ==============================================================================

# Enhance logs with configuration related information
if [[ -z "$(bashio::config 'username')" || -z "$(bashio::config 'password')" ]]; then
    bashio::log.warning "Username and/or password are empty, not using authentication"
fi

if [[ -e "$(bashio::config 'serial_device')" ]]; then
    bashio::log.info "Device found: $(bashio::config 'serial_device')"
else
    bashio::log.error "Device NOT found: $(bashio::config 'serial_device')"
fi

if [[ -z "$(bashio::config 'use_tls')" ]]; then
    bashio::log.info "TLS enabled - certs are stored in /ssl/<filename>"
fi

# Get configuration values and write /etc/miqro.yml configuration
bashio::var.json \
  log_level "$(bashio::config 'log_level')" \
  host "$(bashio::config 'host')" \
  port "^$(bashio::config 'port')" \
  username "$(bashio::config 'username')" \
  password "$(bashio::config 'password')" \
  keepalive "^$(bashio::config 'keepalive')" \
  serial_device "$(bashio::config 'serial_device')" \
  baudrate "^$(bashio::config 'baudrate')" \
  timeout "$(bashio::config 'timeout')" \
  use_tls "^$(bashio::config 'use_tls')" \
  ca_certs "$(bashio::config 'ca_certs')" \
  certfile "$(bashio::config 'certfile')" \
  keyfile "$(bashio::config 'keyfile')" \
  cert_reqs "$(bashio::config 'cert_reqs')" \
  tls_version "$(bashio::config 'tls_version')" \
  ciphers "$(bashio::config 'ciphers')" \
  | tempio \
    -template /usr/share/tempio/miqro.gtpl \
    -out /etc/miqro.yml

# Wait mosquitto
bashio::net.wait_for $(bashio::config 'port')

# Start the inetbox service
bashio::log.info "Starting Truma Inetbox service..."
. /write_configuration.sh
exec python -m ha_inetbox.homeassistant_truma_service