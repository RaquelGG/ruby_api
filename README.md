# Ruby on Rails Geolocation by host API

This RESTful API provides geolocation data from a host (an IP or URL). It fetches the geolocation data from a third party API ([ipstack.com](ipstack.com)).

## To set up the API

1. Go to [Dockerfile line 63](https://github.com/RaquelGG/ruby_api/blob/a7dd4b15e3040d6366c664cd8b50cc0c98618d69/Dockerfile#L63) and replace `YOUR_IPSTACK_ACESS_KEY` with your ipstack access key.
2. Open a terminal inside the project, in the root folder, the same that contains the docker_compose.yml file.
3. Build the docker image 
```console
docker-compose build
```
1. Run the pending migrations and seed the database
```console
docker-compose run ruby_api bin/rails db:migrate db:seed
```
1. Run the service
```console
docker-compose up -d
```
1. If you want to run the specs
```console
docker-compose run ruby_api bin/rails db:environment:set RAILS_ENV=test
docker-compose run ruby_api bin/rails db:test:prepare RAILS_ENV=test
docker-compose run ruby_api bundle exec rspec
```


## Endpoints
All the requests should contain a header with the `ApiKey` and the requests that have content should include the `Content-Type`
```json
    {
        "ApiKey": "e0cf239d-65d4-45a6-b2f7-18400a620f74",
        "Content-Type": "application/vnd.api+json"
    }
```

### Index
http://localhost:3000/locations
```console
curl --request GET \
  --url http://localhost:3000/locations \
  --header 'ApiKey: e0cf239d-65d4-45a6-b2f7-18400a620f74'
```

### GET
With an ULR or IP address
http://localhost:3000/locations/7.7.7.7
```console
curl --request GET \
  --url http://localhost:3000/locations/7.7.7.7 \
  --header 'ApiKey: e0cf239d-65d4-45a6-b2f7-18400a620f74'
```
### Create
http://localhost:3000/locations
```json
{
	"data": {
		"type": "locations",
		"attributes": {
			"host": "google.com"
		}
	}
}
```
```console
curl --request POST \
  --url http://localhost:3000/locations \
  --header 'ApiKey: e0cf239d-65d4-45a6-b2f7-18400a620f74' \
  --header 'Content-Type: application/vnd.api+json' \
  --data '{
	"data": {
		"type": "locations",
		"attributes": {
			"host": "google.com"
		}
	}
}'
```
### Destroy
With an ULR or IP address http://localhost:3000/locations/7.7.7.7
```console
curl --request DELETE \
  --url http://localhost:3000/locations/7.7.7.7 \
  --header 'ApiKey: e0cf239d-65d4-45a6-b2f7-18400a620f74'
```


