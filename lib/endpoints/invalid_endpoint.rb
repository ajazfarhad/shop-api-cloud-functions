# frozen_string_literal: true

require_relative 'base_endpoint'
require_relative '../handlers/error_response_handler'

# object for handling invalid endpoint request
class InvalidEndpoint < BaseEndpoint
  def call
    response
  end

  private

  def response
    ErrorResponseHandler.call(message: 'Error: invalid request path.', status: 404)
  end
end
