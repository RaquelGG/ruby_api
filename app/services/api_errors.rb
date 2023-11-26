# frozen_string_literal: true

class ApiErrors
    def self.not_found_content
        {
            'errors': [
                {
                    'status': '404',
                    'code': '404',
                    'title': I18n.t('api_errors.not_found.title'),
                    'detail': I18n.t('api_errors.not_found.detail'),
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
                    'title': I18n.t('api_errors.unauthorized.title'),
                    'detail': I18n.t('api_errors.unauthorized.detail'),
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
                    'title': I18n.t('api_errors.forbidden.title'),
                    'detail': I18n.t('api_errors.forbidden.detail'),
                }
            ] 
        }
    end
end