import os
os.environ["RNADIST_CONFIG_FILE"] = "customConfig.yaml"
from RNAdist.dashboard.app import app, get_layout, celery
from RNAdist.dashboard import CONFIG
from RNAdist.dashboard.helpers import Database

db = Database(CONFIG["DATABASE"])
db.create_database()

app.layout = get_layout()

server = app.server
