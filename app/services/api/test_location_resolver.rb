# frozen_string_literal: true

module Api
    class TestLocationResolver < LocationResolver        
        def fetch(host:)
            if host == "8.8.8.8"
                return valid_ip_address

            if host == "a"
                return invalid_ip_address
            end

            valid_url
        end

        private

        def invalid_ip_address
            {"success"=>false, "error"=>{"code"=>106, "type"=>"invalid_ip_address", "info"=>"The IP Address supplied is invalid."}}
        end

        def valid_url
            {
                "ip"=>"142.250.31.113",
                "type"=>"ipv4",
                "continent_code"=>"NA",
                "continent_name"=>"North America",
                "country_code"=>"US",
                "country_name"=>"United States",  
                "region_code"=>"CA",
                "region_name"=>"California",
                "city"=>"Mountain View",
                "zip"=>"94043",
                "latitude"=>37.419158935546875,
                "longitude"=>-122.07540893554688,
                "location"=> {
                    "geoname_id"=>5375480,
                    "capital"=>"Washington D.C.",
                    "languages"=>[{"code"=>"en", "name"=>"English", "native"=>"English"}],
                    "country_flag"=>"https://assets.ipstack.com/flags/us.svg",
                    "country_flag_emoji"=>"🇺🇸  ",
                    "country_flag_emoji_unicode"=>"U+1F1FA U+1F1F8",
                    "calling_code"=>"1",
                    "is_eu"=>false
                }
            }
        end

        def valid_ip_address
            {
                "ip"=>"8.8.8.8",
                "type"=>"ipv4",
                "continent_code"=>"NA",
                "continent_name"=>"North America",
                "country_code"=>"US",
                "country_name"=>"United States",
                "region_code"=>"OH",
                "region_name"=>"Ohio",
                "city"=>"Glenmont",
                "zip"=>"44628",
                "latitude"=>40.5369987487793,
                "longitude"=>-82.12859344482422,
                "location"=> {
                    "geoname_id"=>nil,
                    "capital"=>"Washington D.C.",
                    "languages"=>[{"code"=>"en", "name"=>"English", "native"=>"English"}],
                    "country_flag"=>"https://assets.ipstack.com/flags/us.svg",
                    "country_flag_emoji"=>"🇺🇸  ",
                    "country_flag_emoji_unicode"=>"U+1F1FA U+1F1F8",
                    "calling_code"=>"1",
                    "is_eu"=>false
                }
            }
        end
    end
end