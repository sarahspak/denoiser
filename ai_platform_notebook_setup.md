# setup an ai platform notebook

```
gcloud config set project spak-hacks
```

```
export INSTANCE_NAME="denoiser-test-eu"
```

```
export MACHINE_TYPE="n1-standard-4"
```

```
export VM_IMAGE_FAMILY="pytorch-1-9-cu110-notebooks"
```

```
export VM_IMAGE_PROJECT="deeplearning-platform-release"
```

```
gcloud notebooks instances create $INSTANCE_NAME \
  --vm-image-project=$VM_IMAGE_PROJECT \
  --vm-image-family=$VM_IMAGE_FAMILY \
  --machine-type=$MACHINE_TYPE --location=$LOCATION
```

then visit [here](https://console.cloud.google.com/ai-platform/notebooks/list/instances?authuser=1) to see the freshly created notebook
