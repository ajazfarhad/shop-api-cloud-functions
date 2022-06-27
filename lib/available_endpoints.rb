# frozen_string_literal: true

# constant modules
require_relative 'endpoints/invalid_endpoint'
require_relative 'endpoints/products_endpoint'

module AvailableEndpoints
  ENDPOINTS = [
    { name: 'ProductsEndpoint', path: '/products' }
  ].freeze
end
