#!/bin/bash
docker container stop $(docker container ls -aq) && docker system prune -af --volumes
docker image ls -q | xargs -I {} docker image rm -f {}