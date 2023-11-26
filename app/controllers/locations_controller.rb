class LocationsController < ActionController::Base
    include JSONAPI::ActsAsResourceController

    before_action :check_api_key

    @Override
    def create
        geolocation = Api::LocationResolverFactory.create.fetch(host: host)
        location = LocationStorage.store(host: host, geolocation: geolocation)

        serialize(location)
    end

    def show_by_host
        location = Location.find_by!(host: host)
        serialize(location)
    end

    def destroy_by_host
        location = Location.find_by!(host: host).destroy
        serialize(location)
    end

    private

    def host
        request.params.dig('data', 'attributes', 'host') || request.params['host']
    end

    def check_api_key
        key = request.headers['ApiKey']

        unless ApiKeyChecker.new(key).valid?
            unauthorized
        end
    end
    

    def serialize(location)
        render json: { 
            "data":
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
