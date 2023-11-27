# frozen_string_literal: true

module Api
    class IpstackLocationResolver < LocationResolver
        URL = 'http://api.ipstack.com'
        
        def fetch(host:)
            request = JSON.parse(Net::HTTP.get(uri(host)))

            raise HostNotFoundError if request["success"] == false
                
            request
        end

        private

        def uri(host)
            URI(URI.parse("#{URL}/#{host}?access_key=#{ENV.fetch('IPSTACK_ACCESS_KEY', "")}"))
        end
    end
end