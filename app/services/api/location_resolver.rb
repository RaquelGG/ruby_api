require 'net/http'

module Api
    class LocationResolver
        class HostNotFoundError < StandardError
            def message
                "Could not fetch the geolocation. Host not found"
            end
        end

        def fetch(host:)
            raise "Not implemented"
        end
    end
end