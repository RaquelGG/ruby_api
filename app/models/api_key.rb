class ApiKey < ApplicationRecord
    validates :key, uniqueness: true, presence: true
end
