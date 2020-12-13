# Simple API for GCP

This repo outlines a simple toy-example of an API built with Flask in Python, containerized with Docker, and deployed to Google Cloud Platform (GCP).

Read the relevant article [here](https://medium.com/@jamescalam).

## Deploy

To create a docker image, navigate to this directory in a CLI and type:

```
docker build -t tup-api .
```

Next, deploy to GCP with:
In the deployment we need to use google cloud SDK to push our API Docker image to GCR, and for that you need to give just this command 

```
# Add the Cloud SDK distribution URI as a package source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update the package list
sudo apt-get update

# Install the Google Cloud SDK
sudo apt-get install google-cloud-sdk
```

Now we have to first authenticate than we can deploy,
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
