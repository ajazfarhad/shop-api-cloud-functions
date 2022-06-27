# frozen_string_literal: true

require 'yaml'
require_relative 'response_handler'
require_relative 'error_response_handler'

# Utility methods for calling shop api
class RequestHandler
  def initialize(request)
    @request = request
  end

  def call(method: :get, path: '')
    endpoint = request_url(path: path)
    response = http_client.run_request(method, endpoint, request_data, content_type: content_type)
    ResponseHandler.call(response)
  rescue StandardError => e
    error_response(e)
  end

  private

  attr_reader :request

  def request_url(path: '')
    "#{base_url}/#{path}"
  end

  def base_url
    ENV['SHOP_API_BASE_URL'] || config['api_url']
  end

  def content_type
    request.content_type || 'application/json'
  end

  def http_client
    @http_client ||= Faraday.new
  end

  def request_data
    request.body.read
  end

  def error_response(exception)
    ErrorResponseHandler.call(message: exception.message)
  end

  def config
    YAML.load_file('config.yml')
  end
end
