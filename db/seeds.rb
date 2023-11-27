# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


ApiKey.find_or_create_by!(key: "e0cf239d-65d4-45a6-b2f7-18400a620f74")
ApiKey.find_or_create_by!(key: "32af3f39-5ec5-47b5-8d44-a96fb8ff01c0")

Location.find_or_create_by!(
                    host: "7.7.7.7", 
                    geolocation: {
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
                )