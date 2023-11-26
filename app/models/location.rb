class Location < ApplicationRecord
    validates :host, uniqueness: true, presence: true
    validates :geolocation, presence: true
end
