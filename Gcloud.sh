#! usr/bin/bash

echo "Let's build the image file"
docker build -t tup-api .


echo "Create the project"
gcloud projects create fastapi-299105 --name = Fastapi


echo "Download google cloud SDK" 

# Add the Cloud SDK distribution URI as a package source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update the package list
edho "Updating"
sudo apt-get update

echo "Install the Google Cloud SDK"
sudo apt-get install google-cloud-sdk

echo "Authenticate with account owner"
gcloud auth login

echo "Configure the docker"
gcloud auth configure-docker


echo "Let's make the container in google cloud"
gcloud builds submit --tag gcr.io/fastapi-299105/tup-api

echo "The Deployment is complete, Now we will test it with postman"
echo "First we will POST the ahmedabad"
curl --location --request POST 'https://tut-api-rhwr225kcq-uc.a.run.app/places?location=Ahmedabad'

echo "Now we wil GET the ahmedabad"
curl --location --request GET 'https://tut-api-rhwr225kcq-uc.a.run.app/places?location=Ahmedabad'

echo "DELETE the ahmedabad"
curl --location --request DELETE 'https://tut-api-rhwr225kcq-uc.a.run.app/places?location=Ahmedabad'

echo "Delete the project"
gcloud projects delete fastapi-299105
