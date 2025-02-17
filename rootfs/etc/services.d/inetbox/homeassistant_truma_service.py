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
