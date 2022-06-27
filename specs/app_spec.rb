# frozen_string_literal: true

require 'functions_framework/testing'
require 'faraday'

RSpec.describe 'shop-api-function api function' do
  include FunctionsFramework::Testing

  context 'when products request' do
    it 'calls the products endpoint' do
      load_temporary 'app.rb' do
        network_response = instance_double(Faraday::Response,
                                           status: 200,
                                           headers: { 'content-type' => 'application/json' },
                                           body: '{}')
        connection = instance_double(Faraday::Connection, headers: {}, run_request: network_response)
        allow(Faraday).to receive(:new).and_return(connection)

        request = make_get_request 'http://localhost:3001/products'
        response = call_http 'shop-api-function', request
        expect(response.status).to eq 200
      end
    end
  end
end
