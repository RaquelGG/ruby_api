class LocationStorage
    def self.store(host:, geolocation:)
        Location.create!(host: host, geolocation: geolocation)        
    end

    def self.get(host:)
        Location.find_by!(host: host)
    end

    def self.destroy(host:)
        Location.find_by!(host: host).destroy
    end
end
