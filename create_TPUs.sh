#!/bin/bash

export PYTORCH_VERSION=1.9

export Z=us-central1-f

gcloud compute tpus create w2v2-tutorial \
--zone=${Z} \
--network=default \
--version=pytorch-1.9 \
--accelerator-type=v3-8
