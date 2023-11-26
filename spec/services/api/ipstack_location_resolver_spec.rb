require 'rails_helper'

RSpec.describe Api::IpstackLocationResolver do
    describe "#fetch" do
        let!(:host) { nil }
        
        subject { described_class.new.fetch(host: host) }

        context "invalid ip address" do
            let!(:host) { "a" }
    
            it do
                expect{subject}.to raise_error(Api::LocationResolver::HostNotFoundError)
            end
        end

        context "fetches the geolocation by ip" do
            let!(:host) { "8.8.8.8" }
            let!(:valid_ip_address_response) do
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

            it do
                expect(eql_hash?(subject, valid_ip_address_response)).to be(true)
            end
        end

        context "fetches the geolocation by domain" do
            let!(:host) { "google.com" }
            let!(:valid_domain_response) do
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

            it do
                expect(eql_hash?(subject, valid_domain_response)).to be(true)
            end
        end
    end

    def eql_hash?(a, b)
        a.keys do |key|
            unless a[key] == b[key]
                return false
            end 
        end

        true
    end
end


