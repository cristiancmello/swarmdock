#!/bin/bash

docker service create \
  --name portainer \
  --network portainer_agent_network \
  --publish 9000:9000 \
  --publish 8000:8000 \
  --replicas=1 \
  --constraint 'node.role == manager' \
  -e AGENT_SECRET=mysecrettoken \
  --mount type=volume,source=portainer_data,destination=/data \
  portainer/portainer -H "tcp://tasks.portainer_agent:9001" --tlsskipverify