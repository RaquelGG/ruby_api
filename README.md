# README

This RESTful API provides geolocation data from a host (an IP or URL). It fetches the geolocation data from a third party api ([ipstack.com](ipstack.com)).

## To set up the api

1. Go to [Dockerfile line 63](https://github.com/RaquelGG/ruby_api/blob/a7dd4b15e3040d6366c664cd8b50cc0c98618d69/Dockerfile#L63) and replace `YOUR_IPSTACK_ACESS_KEY` with your ipstack access key.
2. Open a terminal inside the project, in the root folder, you should be able to see the docker_compose.yml file.
3. Build the docker image 
```console
docker-compose build
```
4. Run the pending migrations and seed the database
```console
docker-compose run ruby_api bin/rails db:migrate db:seed
```
5. Run the service
```console
docker-compose up -d
```
6. If you want to run the specs
```console
docker-compose run ruby_api bin/rails db:environment:set RAILS_ENV=test
docker-compose run ruby_api bin/rails db:test:prepare RAILS_ENV=test
docker-compose run ruby_api bundle exec rspec
```


## Endpoints
All the requests should contain a header with the `ApiKey` and the `Content-Type`
```
    {
        'ApiKey': 'e0cf239d-65d4-45a6-b2f7-18400a620f74'
        'Content-Type': 'application/vnd.api+json'
    }
```

### Index
http://localhost:3000/locations

### GET
With an ULR or IP address
http://localhost:3000/locations/7.7.7.7

### Create
http://localhost:3000/locations
```
{
	"data": {
		"type": "locations",
		"attributes": {
			"host": "google.com"
		}
	}
}
```
### Destroy
With an ULR or IP address http://localhost:3000/locations/7.7.7.7
