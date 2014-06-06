#!/usr/bin/env bash
# curl "https://hub.gdgx.io/api/v1/events?perpage=9999999" | ./process.json.py
curl "https://hub.gdgx.io/api/v1/chapters?perpage=9999999" | ./process.json.py
