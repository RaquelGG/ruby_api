class LocationsController < JSONAPI::ResourceController
    before_action :check_api_key

    private

    def check_api_key
        key = request.headers['ApiKey']

        unless ApiKeyCheckerService.new(key).valid?
            unauthorized
        end
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
