Deploying to Google Cloud
=========================

## Dependencies
Templating: Jinja2
```
pip install j2cli
```

Google Cloud tooling
```
curl https://sdk.cloud.google.com | bash
gcloud init
```

## Configuration
Set all environment variables in a file, like the template given as ```nightscout-settings.env```.

Run:
```./generate-cloud-init.sh```

This will replace all variables in the 'nightscout-cloud-init' file, that will be used to start the VM in google cloud.

## Create a google cloud account and a project to run nightscout in

http://console.cloud.google.com/

Be sure to enable the year long free trial.

# Create the VM and database

```
./create-machine.sh
```
