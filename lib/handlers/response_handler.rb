# frozen_string_literal: true

# Response handler object
class ResponseHandler
  def initialize(response)
    @response = response
  end

  attr_reader :response,

  def self.call(response)
    new(response).prepare_response
  end

  def prepare_response
    JSON.parse(response.body)
  end
end
