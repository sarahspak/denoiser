#!/bin/bash

## do this before setting up the TPUs
# following tutorial here https://cloud.google.com/tpu/docs/tutorials/wav2vec2-pytorch?authuser=1#before-you-begin

PROJECT_ID='spak-hacks'
gcloud config set project ${PROJECT_ID}

# gsutil mb -p ${PROJECT_ID} -c standard -l us-central1 -b on gs://training-data-and-results

export STORAGE_BUCKET=gs://training-data-and-results
export VM_NAME=train-denoiser
export Z=us-central1-f

gcloud compute instances create ${VM_NAME} \
  --zone=${Z} \
  --machine-type=n1-highmem-96 \
  --image-family=torch-xla \
  --image-project=ml-images  \
  --boot-disk-size=200GB \
  --scopes=https://www.googleapis.com/auth/cloud-platform

gcloud compute ssh ${VM_NAME} --zone=${Z}
