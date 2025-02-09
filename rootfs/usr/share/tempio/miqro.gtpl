broker:
  host: {{ .host }}
  port: {{ .port }}
  keepalive: {{ .keepalive }}
log_level: {{ .log_level }}
services:
  truma:
    serial_device: {{ .serial_device }}
    baudrate: {{ .baudrate }}
    timeout: {{ .timeout }}

{{ if and .username .password }}
auth: 
  username: "{{ .username }}"
  password: "{{ .password }}"
{{end}}

{{ if eq true .use_tls }}
tls:
  ca_certs: /ssl/{{ .ca_certs }}
  certfile: /ssl/{{ .certfile }}
  keyfile: /ssl/{{ .keyfile }}
  cert_reqs: {{ .cert_reqs }}
  tls_version: {{ .tls_version }}
  ciphers: {{ .ciphers }}
{{end}}