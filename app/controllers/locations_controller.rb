class LocationsController < ActionController::Base
    include JSONAPI::ActsAsResourceController

    before_action :check_api_key

    @Override
    def create
        geolocation = Api::LocationResolverFactory.create.fetch(host: host)
        location = LocationStorage.store(host: host, geolocation: geolocation)

        serialize(location)

    rescue Api::LocationResolver::HostNotFoundError
        not_found_response
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
            unauthorized_response
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

    def not_found_response
        render json: { 
            'errors': [
                {
                    'status': '404',
                    'code': '404',
                    'title': 'Not found',
                    'detail': 'Could not fetch the geolocation. Host not found',
                }
            ] 
        }, status: :not_found
    end

    def unauthorized_response
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
