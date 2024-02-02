import yaml

from models.occupancy_reader import OccupancyDataReader
from models.watcher import Watcher

with open("./config/itdc_config.yml", "r") as file:
    itdc_config = yaml.safe_load(file)

    driver = OccupancyDataReader(
        host=itdc_config["host"],
        user=itdc_config["user"],
        password=itdc_config["password"],
        database=itdc_config["database"],
        path=itdc_config["directory_to_watch"],
    )

    watcher = Watcher(path=itdc_config["directory_to_watch"], driver=driver)

if __name__ == "__main__":
    watcher.run()
