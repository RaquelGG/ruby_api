class LocationsController < ActionController::Base
    include JSONAPI::ActsAsResourceController

    before_action :check_api_key

    @Override
    def create
        if request.params.dig('data', 'attributes', 'id').present?
            render json: ApiErrors.forbidden_content, status: :forbidden
            return
        end

        geolocation = Api::LocationResolverFactory.create.fetch(host: host)
        location = LocationStorage.store(host: host, geolocation: geolocation)

        render json: serialize(location), status: :created

    rescue Api::LocationResolver::HostNotFoundError
        render json: ApiErrors.not_found_content, status: :not_found
    end

    def show_by_host
        location = LocationStorage.get(host: host)
        render json: serialize(location)
    end

    def destroy_by_host
        location = LocationStorage.destroy(host: host)
        render json: serialize(location)
    end

    private

    def host
        request.params.dig('data', 'attributes', 'host') || request.params['host']
    end

    def check_api_key
        key = request.headers['ApiKey']

        unless ApiKeyChecker.new(key).valid?
            render json: ApiErrors.unauthorized_content, status: :unauthorized
        end
    end

    def serialize(location)
        { 
            "data":
                JSONAPI::ResourceSerializer.new(LocationResource)
                    .object_hash(LocationResource
                    .new(location, nil), nil)
        }
    end
end
