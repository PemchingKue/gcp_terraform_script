## INSTALL STEPS
```sh
bundle install
```

## START APP
```sh
bundle exec ruby app.rb
```

## BUILD CONTAINER

cd into Dockerfile location (ex: 'cd cloud-run/ruby-app/') then run:
```sh
docker build -t 'ruby-app:latest' .
```

## RUN CONTAINER IN CODESPACE TO TEST
```sh
docker run -t ruby-app:latest
```


## RUN CONTAINER GCLOUD CLI
```sh
gcloud run deploy --source .
```
