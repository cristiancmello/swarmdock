#!/bin/bash

docker service create \
  --name portainer_agent \
  --network portainer_agent_network \
  --mode global \
  --constraint 'node.platform.os == linux' \
  -e CAP_HOST_MANAGEMENT=1 \
  -e AGENT_SECRET=mysecrettoken \
  --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
  --mount type=bind,src=//var/lib/docker/volumes,dst=/var/lib/docker/volumes \
  portainer/agent