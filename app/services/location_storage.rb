class LocationStorage
    def self.store(host:)
        geolocation = location_resolver.fetch(host: host)
        Location.create!(host: host, geolocation: geolocation)        
    end

    def self.get(host:)
        Location.find_by!(host: host)
    end

    def self.destroy(host:)
        Location.find_by!(host: host).destroy
    end

    private

    def self.location_resolver
        Api::LocationResolverFactory.create
    end
end
