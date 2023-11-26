class LocationsController < JSONAPI::ResourceController
    before_action :check_api_key

    @Override
    def create
        geolocation = Api::LocationResolverFactory.create.fetch(host: host)
        location = LocationStorage.store(host: host, geolocation: geolocation)

        render json: serialize(location)
    end

    private

    def host
        request.params['data']['attributes']['host']
    end

    def check_api_key
        key = request.headers['ApiKey']

        unless ApiKeyChecker.new(key).valid?
            unauthorized
        end
    end
    

    def serialize(location)
        { "data":
            JSONAPI::ResourceSerializer.new(LocationResource)
                .object_hash(LocationResource
                .new(location, nil), nil)
        }
    end

    def unauthorized
        render json: { 
                'errors': [
                    {
                        'status': '401',
                        'code': '401',
                        'title': 'Unauthorized',
                        'detail': 'Invalid api key',
                    }
                ] 
            }, status: :unauthorized
    end
end
