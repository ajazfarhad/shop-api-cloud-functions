# frozen_string_literal: true

require 'functions_framework'
require 'json'
require 'faraday'
require_relative 'lib/request_resolver'

FunctionsFramework.http('shop-api-function') do |request|
  handler = RequestResolver.new(request).resolve_to_handler
  handler.call
end
