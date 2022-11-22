#!/usr/bin/env python3

import json
import sys

data = json.load(sys.stdin)

domain_name = sys.argv[1]
custom_domain = sys.argv[2]

for reservation in data['Reservations']:
    tags = reservation["Instances"][0]["Tags"]
    for tag in tags:
        if tag["Key"] == "Type":
            node_type = tag["Value"]
        if tag["Key"] == "Name":
            node_index = tag["Value"][-1]

if node_type == "primary":
    print("mongo1" + domain_name)
else:
    print("mongo" + str(int(node_index)+1) + domain_name)