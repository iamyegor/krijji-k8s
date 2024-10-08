#!/bin/bash

# Clean up unused images
for image in $(sudo ctr -n k8s.io images list -q); do
    sudo ctr -n k8s.io images rm $image
done

# Clean up unused containers
for container in $(sudo ctr -n k8s.io containers list -q); do
    sudo ctr -n k8s.io containers rm $container
done

# Clean up unused snapshots
for snapshot in $(sudo ctr -n k8s.io snapshot list -q); do
    sudo ctr -n k8s.io snapshot rm $snapshot
done

