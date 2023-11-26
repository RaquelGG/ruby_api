require 'net/http'

module Api
    class LocationResolver
        class HostNotFoundError < StandardError; end

        def fetch(host:)
            raise 'Not implemented'
        end
    end
end