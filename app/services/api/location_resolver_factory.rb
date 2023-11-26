require 'net/http'

module Api
    class LocationResolverFactory
        def self.create
            return TestLocationResolver.new if Rails.env.test?
                
            IpstackLocationResolver.new
        end
    end
end
