# setting up a cloud tpu

1. Basic setup

```
export PROJECT_ID=spak-projects && gcloud config set project $PROJECT_ID
```

2. create a bucket for training data and results

```
gsutil mb -p ${PROJECT_ID} -c standard -l us-central1 -b on gs://training-data-and-results
```

```
export STORAGE_BUCKET=gs://training-data-and-results
```

## set up the TPU and vms

```
gcloud compute tpus execution-groups create  --name=mnist-tutorial  --zone=us-central1-f  --tf-version=2.4.1  --machine-type=n1-standard-1  --accelerator-type=v2-8
```

once we are connected to the mnist-tutorial gcp vm...

```
export STORAGE_BUCKET=gs://training-data-and-results && export TPU_NAME=mnist-tutorial && export MODEL_DIR=$STORAGE_BUCKET/mnist && export DATA_DIR=$STORAGE_BUCKET/data && export PYTHONPATH="$PYTHONPATH:/usr/share/models"
```

## run the model

it's absurdly fast

```
cd /usr/share/models/official/vision/image_classification
```

## clean up

```
exit
```

then delete to save on costs

```
gcloud compute tpus execution-groups delete mnist-tutorial  --zone=us-central1-f
```

check to see if it's there by running

```
gcloud compute tpus execution-groups list --zone=us-central1-f
```

and get rid of bucket by running

```
gsutil rm -r gs://training-data-and-results
```
