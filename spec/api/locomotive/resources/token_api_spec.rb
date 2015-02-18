require 'spec_helper'

module Locomotive
  module Resources
    describe TokenAPI do
      include Rack::Test::Methods
      let(:account) { create :account }

      context 'with email and password' do

        describe 'POST /locomotive/api_test/v2/token' do
          context 'JSON' do
            before do
              post('/locomotive/api_test/v2/token.json', { email: account.email, password: 'easyone' })
            end

            subject { last_response }

            it 'responds with status 201' do
              expect(subject.status).to eq 201
            end

            it 'responds with the correct body' do
              expect(parsed_response).to eq({ 'token' => account.reload.authentication_token })
            end
          end
        end

      end
    end
  end
end
