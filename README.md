# INSTRUCTIONS

In this document you will find the instructions on how to run the url shortener app. The app has 2 endpoints ```/getShortUrl```, and one that redirects the short url to the long url and increases the visits count. The app by default works on ```localhost:8080```, ```0.0.0.0:8080```, and ```127.0.0.1:8080``` network. The ```base_url``` is set to ```<http://tier.app>``` in the app's docker container environment vars in ```docker-compose.yml```. ```base_url``` can be changed to any other valid url base like ```<http://short.est>```.  The redirect endpoint (which is a bonus functionality for this app) works when the generated id is extracted from the short url which comes after the base url and surfing it via localhost:8080. The app connects to a postgres db with a connection string of ```postgres://user:OpenSesame@localhost:5432/shortner```. The database contains two tables ```urls``` and ```stats```. ```urls``` table stores generated unique ids and their mapped long urls. ```stats``` stores ids and the visits count for that id.

## HOW TO

Use the terminal to run the following commands:

## How to run the app in docker

```bash

docker-compose up

```

## How to stop the app in docker

```bash

docker-compose down 

```

## How to send getShortUrl request example

Use a new terminal to send a request to the endpoint ```/getShortUrl```. Example:

```bash

curl -X 'POST' \
  'http://0.0.0.0:8080/getShortUrl' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "long_url": "http://www.google.com"
}'

```

Replace the value of ```"long_url"``` to any other valid website to generate the short url for it. Example ```"long_url": "http://www.yahoo.com"```

## How to send a redirect request example

Extract the id from the returned response of ```/getShortUrl``` request. Example:  From```<http://tier.app/UL6F9R>``` take ```UL6F9R>```

Then go to the browser and surf ```<http://0.0.0.0:8080/UL6F9R>``` and the request will be redirected to the long url stored in the db if found and

visits_count in stats table will be incremented by one.
