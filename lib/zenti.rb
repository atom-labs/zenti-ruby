# frozen_string_literal: true

require 'rest-client'

module Zenti

  API_BASE = "https://bankcardconnect.transactiongateway.com/api/transact.php"

  class ZentiError < StandardError
  end

  class AuthenticationError < ZentiError;
  end
  class ConfigurationError < ZentiError;
  end
  class ApiRequestError < ZentiError
    attr_reader :response_code, :response_headers, :response_body

    def initialize(response_code:, response_headers:, response_body:)
      @response_code = response_code
      @response_headers = response_headers
      @response_body = response_body
    end
  end

  class << self
    def security_key
      defined? @security_key and @security_key or raise(
        ConfigurationError, "Zenti security_key not configured"
      )
    end

    attr_writer :security_key

    def request method, params = {}
      defined? method or raise(
        ArgumentError, "Request method has not been specified"
      )
      if method == :get
        headers = {:accept => :json, content_type: :json}.merge({params: params})
        payload = nil
      else
        payload = params.merge({security_key: Zenti.security_key}).stringify_keys
        headers = {:accept => :json, content_type: :json}.merge({params: payload})
      end
      puts '--- payload sent ---'
      puts payload
      puts '--- payload sent ---'
      RestClient::Request.new({
                                method: method,
                                url: API_BASE,
                                payload: payload ? payload.to_json : nil,
                                headers: headers
                              }).execute do |response, request, result|
        str_response = CGI::parse response.to_str
        return str_response
        # str_response.blank? ? '' : JSON.parse(str_response)
      end
    end

    def datetime_format datetime
      datetime.strftime("%Y-%m-%d %T")
    end
  end
end
