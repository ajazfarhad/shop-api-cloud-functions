# frozen_string_literal: true

require_relative '../handlers/request_handler'

# Base class for endpoint objects
class BaseEndpoint
  def initialize(request)
    @request = request
  end

  def call
    RequestHandler.new(request).call(path: mapped_path)
  end

  attr_reader :request

  def mapped_path; end
end
