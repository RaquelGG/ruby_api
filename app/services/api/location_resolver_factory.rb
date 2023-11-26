require 'net/http'

module Api
    class LocationResolverFactory
        def self.create
            if Rails.env.test?
                return TestLocationResolver.new
            end
            IpstackLocationResolver.new
        end
    end
end
