class ApiKeyChecker
    def self.valid?(key)
        ApiKey.exists?(key: key)
    end
end
