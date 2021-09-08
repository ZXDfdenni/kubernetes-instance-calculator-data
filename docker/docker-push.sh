#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  Docker Push Container
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  License    : Apache v2
# -----------------------------------------------------------------------------
set -e

export IMAGE="zeroc0d3/k8s-calculator"
export TAG="1.0.0"

echo " Push Image => $IMAGE:$TAG"
docker push $IMAGE:$TAG