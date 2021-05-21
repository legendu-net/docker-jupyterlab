#!/usr/bin/env python3
import json
from jupyter_server import serverapp

servers = list(serverapp.list_running_servers())
print(json.dumps(servers, indent=4))
