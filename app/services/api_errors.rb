# frozen_string_literal: true

class ApiErrors
    def self.not_found_content()
        {
            'errors': [
                {
                    'status': '404',
                    'code': '404',
                    'title': 'Not found',
                    'detail': 'Could not fetch the geolocation. Host not found',
                }
            ]
        }
    end

    def self.unauthorized_content
        { 
            'errors': [
                {
                    'status': '401',
                    'code': '401',
                    'title': 'Unauthorized',
                    'detail': 'Invalid api key',
                }
            ] 
        }
    end

    def self.forbidden_content
        { 
            'errors': [
                {
                    'status': '403',
                    'code': '403',
                    'title': 'Forbidden',
                    'detail': 'Unsupported request to create a resource with a client-generated ID',
                }
            ] 
        }
    end
end