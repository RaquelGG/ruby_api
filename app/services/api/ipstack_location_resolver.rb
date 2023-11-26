# frozen_string_literal: true

module Api
    class IpstackLocationResolver < LocationResolver
        URL = 'http://api.ipstack.com'
        ACCESS_KEY = '70f38bd7b5f8c90a075e32d2cd267be0'
        
        def fetch(host:)
            request = JSON.parse(Net::HTTP.get(uri(host)))

            if request["success"] == false
                raise Exception.new "Could not fetch the geolocation. Host not found"
            end

            request
        end

        private

        def uri(host)
            URI(URI.parse("#{URL}/#{host}?access_key=#{ACCESS_KEY}"))
        end
    end
end