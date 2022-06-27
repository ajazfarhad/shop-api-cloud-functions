# frozen_string_literal: true

require_relative 'available_endpoints'
require_relative 'handlers/request_handler'

# object for handling incoming http request
# this object identifies the requested path
# forwards the request to correct endpoint object
# returns the endpoint object
class RequestResolver
  ERROR_HANDLER = -> { { name: 'InvalidEndpoint' } }

  def initialize(request)
    @request = request
  end

  def resolve_to_handler
    handler = AvailableEndpoints::ENDPOINTS.find(ERROR_HANDLER) do |h|
      case h[:path]
      when Regexp
        h[:path].match?(request.path)
      else
        h[:path] == request.path
      end
    end
    Object.const_get(handler.fetch(:name)).new(request)
  end

  private

  attr_reader :request
end
