require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  let!(:key) { "new key" }
  

  describe "#find_by" do
        subject { described_class.find_by(key: key) }

        context 'the location exists' do
          let!(:api_key) { create(:api_key, key: key) }

            it do
                expect(subject.key).to eql(key)
            end
        end

        context 'the specified key does not exist' do
            let!(:key) { "doesnotexist" }

            it do
                expect(subject).to be_nil
            end
        end
    end

    describe "#create" do
        subject { described_class.create(key: key) }

        it do
            expect(subject).to be_valid
            expect(described_class.count).to eql(1)
        end

        it 'the specified key is already in use' do
            create(:api_key, key: key)

            expect(subject).not_to be_valid
        end

        context 'key is nil' do
            let!(:key) { nil }
            it do
                expect(subject).not_to be_valid
            end
        end
    end
end
