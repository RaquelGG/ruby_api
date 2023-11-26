class LocationResource < JSONAPI::Resource
    attributes :host, :geolocation

    def self.find_by_keys(keys, context)
        puts "test----------------------------------------------------------------------------"
    end
end
