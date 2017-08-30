#!/usr/bin/env python3
# encoding: utf-8

from notebook import notebookapp

servers = list(notebookapp.list_running_servers())
print(servers)
