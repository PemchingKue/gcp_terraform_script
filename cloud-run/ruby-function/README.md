## INSTALL STEPS

https://docs.cloud.google.com/run/docs/quickstarts/functions/deploy-functions-gcloud#ruby

```sh
bundle init
bundle install
```

## DEPLOY FUNCTIONS

```sh
gcloud run deploy ruby-http-function \
--source . \
--function hello_get \
--base-image ruby34 \
--region us-east1 \
--allow-unauthenticated
```