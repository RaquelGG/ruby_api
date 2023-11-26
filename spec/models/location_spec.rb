require 'rails_helper'

RSpec.describe Location, type: :model do
    let!(:host) { "7.7.7.7" }
    let!(:geolocation) { {"ip": "7.7.7.7", "hostname": "7.7.7.7",  "type": "ipv4"}.to_s }
    let!(:location) { nil }

    describe "#find" do
        let!(:location_id) { location&.id }
        subject { described_class.find(location_id) }

        context 'the location exists' do
            let!(:location) { create(:location, host: host, geolocation: geolocation) }

            it do
                location = subject

                expect(location.host).to eql(host)
                expect(location.geolocation).to eql(geolocation)
            end
        end

        context 'the specified id does not exist' do
            let!(:location_id) { nil }

            it do
                expect{subject}.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end

    describe "#find_by" do
        subject { described_class.find_by(host: host) }

        context 'the location exists' do
            before { create(:location, host: host, geolocation: geolocation) }

            it do
                location = subject

                expect(location.host).to eql(host)
                expect(location.geolocation).to eql(geolocation)
            end
        end

        context 'the specified host does not exist' do
            let!(:host) { "doesnotexist.com" }

            it do
                expect(subject).to be_nil
            end
        end
    end

    describe "#create" do
        subject { described_class.create(host: host, geolocation: geolocation) }

        it do
            expect(subject).to be_valid
            expect(described_class.count).to eql(1)
        end

        it 'the specified host is already in use' do
            described_class.create(host: host, geolocation: geolocation)

            expect(subject).not_to be_valid
        end

        context 'host is nil' do
            let!(:host) { nil }
            it do
                expect(subject).not_to be_valid
            end
        end

        context 'geolocation is nil' do
            let!(:geolocation) { nil }
            it do
                expect(subject).not_to be_valid
            end
        end
    end

    describe "#destroy" do
        let!(:location) { create(:location, host: host, geolocation: geolocation) }

        subject { described_class.destroy(location.id) }

        it do
        expect(subject).to be_valid
        expect(described_class.count).to eql(0)
        end

        it 'the specified id does not exist' do
            described_class.destroy(location.id)

            expect{subject}.to raise_error(ActiveRecord::RecordNotFound)
        end
    end
  
    describe "#destroy_by" do
        let!(:location) { create(:location, host: host, geolocation: geolocation) }

        subject { described_class.destroy_by(host: host) }

        it do
            subject
            expect(described_class.count).to eql(0)
        end

        it 'the specified host does not exist' do
            described_class.destroy(location.id)

            expect(subject).to eql([])
        end
    end
end
