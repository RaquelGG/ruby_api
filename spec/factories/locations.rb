FactoryBot.define do
  factory :location do
    host { "134.201.250.155" }
    geolocation {
      {
        "ip": "134.201.250.155",
        "hostname": "134.201.250.155",
        "type": "ipv4",
        "continent_code": "NA",
        "continent_name": "North America",
        "country_code": "US",
        "country_name": "United States",
        "region_code": "CA",
        "region_name": "California",
        "city": "Los Angeles",
        "zip": "90013",
        "latitude": 34.0453,
        "longitude": -118.2413,
        "location": {
          "geoname_id": 5368361,
          "capital": "Washington D.C.",
        },
        "time_zone": {
          "id": "America/Los_Angeles",
          "current_time": "2018-03-29T07:35:08-07:00",
          "gmt_offset": -25200,
          "code": "PDT",
          "is_daylight_saving": true
        },
        "currency": {
          "code": "USD",
          "name": "US Dollar",
          "plural": "US dollars",
          "symbol": "$",
          "symbol_native": "$"
        },
        "connection": {
          "asn": 25876,
          "isp": "Los Angeles Department of Water & Power"
        }
      }.to_json
    }
  end
end
