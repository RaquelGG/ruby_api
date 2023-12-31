require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
    let(:location) { create(:location) }
    let(:api_key) { create(:api_key) }
    let(:key) { api_key.key }
    let(:success_body_response) do
        {
            "data": {
                "id": "#{location.id}",
                "type": "locations",
                "links": {
                    "self": "/locations/#{location.id}"
                },
                "attributes": {
                    "host": "google.com",
                    "geolocation": "#{location.geolocation}"
                }
            }
        }
    end

    describe "#create" do
        let(:params) do 
            {
                "data": {
                    "type": "locations",
                    "attributes": {
                        "host": "google.com"
                    }
                }
            } 
        end

        before :each do
            request.headers['ApiKey'] = key
            post :create, params: params
        end

        it "returns a success response" do
            expect(response).to have_http_status(:created)
            expect(eql_hash?(JSON.parse(response.body), success_body_response)).to be(true)
            expect(Location.count).to eql(2)
        end

        
        context "the request contains an id" do
            let(:params) do 
                {
                    "data": {
                        "type": "locations",
                        "attributes": {
                            "host": "google.com",
                            "id": 1
                        }
                    }
                } 
            end

            it do
                expect(response).to have_http_status(:forbidden)
            end
        end

        context "the host already exists" do
            let(:params) do 
                {
                    "data": {
                        "type": "locations",
                        "attributes": {
                            "host": "#{location.host}"
                        }
                    }
                } 
            end
        end
        
        context "cannot obtain host from the remote api" do
            let(:params) do 
                {
                    "data": {
                        "type": "locations",
                        "attributes": {
                            "host": "a"
                        }
                    }
                } 
            end

            it do
                expect(response).to have_http_status(:not_found)
            end
        end

        context "the api key is not valid" do
            let(:key) { "invalid api key" }

            it do
                expect(response).to have_http_status(:unauthorized)
            end
        end
    end

    describe "#show_by_host" do
        let(:host) { location.host }

        before :each do
            request.headers['ApiKey'] = key
            delete :show_by_host, params: { host: host }
        end

        it "returns a success response" do
            expect(response).to have_http_status(:success)
            expect(eql_hash?(JSON.parse(response.body), success_body_response)).to be(true)
        end

        context "host does not exist" do
            let(:host) { "a" }

            it do
                expect(response).to have_http_status(:not_found)
            end
        end

        context "the api key is not valid" do
            let(:key) { "invalid api key" }

            it do
                expect(response).to have_http_status(:unauthorized)
            end
        end
    end

    describe "#destroy_by_host" do
        let(:host) { location.host }

        before :each do
            request.headers['ApiKey'] = key
            delete :destroy_by_host, params: { host: host }
        end

        it "returns a success response" do
            expect(response).to have_http_status(:success)
            expect(eql_hash?(JSON.parse(response.body), success_body_response)).to be(true)
            expect(Location.count).to eql(0)
        end

        context "host does not exist" do
            let(:host) { "a" }

            it do
                expect(response).to have_http_status(:not_found)
            end
        end

        context "the api key is not valid" do
            let(:key) { "invalid api key" }

            it do
                expect(response).to have_http_status(:unauthorized)
            end
        end
    end

    describe "#index" do
        before :each do
            request.headers['ApiKey'] = key
            get :index
        end

        it "returns a success response" do
            expect(response).to have_http_status(:success)
            expect(eql_hash?(JSON.parse(response.body), success_body_response)).to be(true)
        end

        context "the api key is not valid" do
            let(:key) { "invalid api key" }

            it do
                expect(response).to have_http_status(:unauthorized)
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