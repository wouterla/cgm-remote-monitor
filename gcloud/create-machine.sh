#!/bin/bash
gcloud config set project nightscout-178620
gcloud config set compute/zone europe-west1-d

# Reserve IP
gcloud compute addresses create nightscout --region europe-west1 -q

# Create network
# Open port 80
gcloud compute firewall-rules create http --allow tcp:80 -q

# Create drive if it doesn't exist yet
gcloud compute disks create mongodb-data --size=10GB --type=pd-ssd -q

# Create new machine w/ cloud init
gcloud compute instances create nightscout \
--boot-disk-type=pd-ssd \
--image-family cos-dev \
--image-project cos-cloud \
--machine-type n1-standard-1 \
--address nightscout \
--scopes storage-rw,compute-rw,cloud-platform,storage-full,logging-write,monitoring,monitoring-write \
--disk 'name=mongodb-data,mode=rw' \
--metadata serial-port-enable=1 \
--metadata-from-file user-data="nightscout-cloud-init"
