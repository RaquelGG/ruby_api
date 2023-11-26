class ApiKey < ApplicationRecord
    validates_presence_of :key
    validates :key, uniqueness: true
end
