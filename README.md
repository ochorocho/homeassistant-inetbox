# HomeAssistant Inetbox Add-on

Integrate mobile heater and AC by Truma/Alde into HomeAssistant using inetbox.py.
This is based on [inetbox.py](https://github.com/danielfett/inetbox.py).

## Configuration

1. Install and configure [the mosquitto](https://github.com/home-assistant/addons/blob/master/mosquitto/DOCS.md) Add-on 
2. Create a user to authenticate against the mosquitto broker. For HomeAssistant mosquitto Add-on users go to http://homeassistant.local:8123/config/users
3. Install the "inetbox" Add-on from the repository https://github.com/ochorocho/homeassistant_repository
4. Configure the "inetbox" Add-on: Add at least user credentials and the broker host. Adjust the other options as needed.

> [!NOTE]
> For a quick overview of the incoming MQTT messages use the
> MQTT Explorer from https://github.com/GollumDom/addon-repository

## ToDo

* create cards
