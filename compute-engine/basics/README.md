.tfvars file hidden, you must provide your own values in a new tvars file \
check quotas folder readme for full setup \

## STEPS FOR TERRAFORM SHORT HAND
```sh
terrform init
```

```sh
export GOOGLE_CLOUD_PROJECT=pkplayground
```

```sh
gcloud iam service-accounts keys create ~/terraform-sa-key.json \
    --iam-account terraform-sa@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com
```

```sh
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/terraform-sa-key.json"
```

## CHECKING AND SSH INTO VM

find vm instance on gconsole and SSH into it \
cd into var/www/html and see if index.html exist \
run command below to check if apache service is running \

```sh
sudo systemctl status apache2
```

## OPEN FIREWALL RULES IN GOOGLE CLOUD
only do this if fire wall rules to open specific port on VM does not exist \

```
go to firewall in google cloud \
click on create a fire wall rule \
enter firewall name: webserver-allowed \
add target tags: http-server and https-server \
ip4 range 0.0.0.0/0 \
allow TCP port 80 \
```

## CHECK IF WEBSERVER VIA BROWSING

get external ip of VM on google cloud and enter it in the web browser, it should show the contents of index.html

## CLEAN UP VM

```sh
terraform destroy
```

