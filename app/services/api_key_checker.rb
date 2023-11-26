class ApiKeyChecker
    def initialize(key)
        @key = key
    end

    def valid?
        ApiKey.exists?(key: key)
    end

    private

    attr_reader :key
end
