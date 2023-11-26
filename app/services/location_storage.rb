class LocationStorage
    def self.store(host:, geolocation:)
        Location.create!(host: host, geolocation: geolocation)        
    end
end
