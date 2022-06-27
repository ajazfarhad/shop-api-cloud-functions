# frozen_string_literal: true

class ErrorResponseHandler
	def initialize(message: '', status: 500)
		@status = status
		@content_type = content_type
		@message = message
	end

	def self.call(message: '', status: 500)
		new(message: message, status: status).call
	end

	def call
		[status, 	{ 'Content-Type' => 'application/json' }, error_message]
	end

	private

	def error_message
		[message]
	end

	attr_reader :status, :content_type, :message
end
