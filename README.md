# HomeAssistant Inetbox Add-on

Integrate mobile heater and AC by Truma/Alde into HomeAssistant using inetbox.py.
This is base on [inetbox.py](https://github.com/danielfett/inetbox.py).

## Configuration

1. Install and configure [the mosquitto](https://github.com/home-assistant/addons/blob/master/mosquitto/DOCS.md) Add-on 
2. Create a user to authenticate against the mosquitto broker (http://homeassistant.local:8123/config/users)
3. Install the "inetbox" Add-on
4. Configure the "inetbox" Add-on: Add at least user credentials and url. Adjust the other options as needed.
5. Optional: For a quick overview of the incoming MQTT messages use the MQTT Explorer from https://github.com/GollumDom/addon-repository


## ToDo

* Add TLS configuration
* Create repository to install this addon