from inetbox import truma_service

class HomeAssistantTrumaService(truma_service.TrumaService):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._prepare_logger(self.config.get("log_level"))

def run():
    service = HomeAssistantTrumaService()
    service.run()

if __name__ == "__main__":
    run()


    # @todo: We may want to enable this once it's working
    # def _on_connect(self, *args, **kwargs):
    #     super()._on_connect(*args, **kwargs)
    
    #     try:
    #         self.log.info(f"Trying to send home assistant discovery messages...")
    #         from ha_inetbox.haconfig import haconfig
    #         haconfig.del_ha_autoconfig(self) 
    #         haconfig.set_ha_autoconfig(self)
    #     except ImportError:
    #         self.log.warning(f"no module `haconfig` for discovery message to home assistant loaded")

# apk add --no-cache python3 py3-pip gcc python3-dev
# pip3 install git+https://github.com/ochorocho/inetbox.py.git --break-system-packages
# pip3 install inetbox-py --break-system-packages
# broker:
#   host: core-mosquitto
#   port: 1883
#   keepalive: 60
# log_level: DEBUG
# services:
#   truma:
#     serial_device: /dev/serial0
#     baudrate: 9600
#     timeout: 0.5
#     debug_app: True
#     debug_lin: True
#     debug_protocol: True
# auth: 
#   username: "mosquitto"
#   password: "GpM1vGJNDa88uTFG"
