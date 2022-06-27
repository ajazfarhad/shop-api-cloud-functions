# frozen_string_literal: true

require_relative 'base_endpoint'

# Object for products list
class ProductsEndpoint < BaseEndpoint
  SHOP_API_PRODUCTS_PATH = 'products'

  def mapped_path
    SHOP_API_PRODUCTS_PATH
  end
end
