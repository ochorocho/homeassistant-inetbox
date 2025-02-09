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
