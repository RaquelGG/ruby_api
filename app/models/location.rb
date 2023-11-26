class Location < ApplicationRecord
    validates_presence_of :host, :geolocation
    validates :host, uniqueness: true
end
