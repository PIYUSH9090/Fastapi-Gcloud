# Simple API for GCP

This repo outlines a simple toy-example of an API built with Flask in Python, containerized with Docker, and deployed to Google Cloud Platform (GCP).

Read the relevant article [here](https://medium.com/@jamescalam).

## Deploy

To create a docker image, navigate to this directory in a CLI and type:

```
docker build -t tup-api .
```

Next, deploy to GCP with:

We have to first authenticate than we can deploy,
for authenticate we will give this 2 commands

```
gcloud auth login
```
After this command you will get the page of your google account which you have to confirm.
After then simply this command,

``` 
gcloud auth configure-docker
```

This is command for deploy to google cloud
```
gcloud builds submit --tag gcr.io/fastapi-298410/tup-api
```

Finally, create a [Cloud Run service](https://console.cloud.google.com/run) using the new container.
