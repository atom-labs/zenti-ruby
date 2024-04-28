# frozen_string_literal: true

require 'rest-client'

# require 'zenti/api_operations/list'
# require 'zenti/api_operations/create'
# require 'zenti/api_operations/retrieve'
# require 'zenti/api_operations/update'
# require 'zenti/api_operations/delete'
# 
# require 'zenti/api_resource'
# require 'zenti/order'
# require 'zenti/customer'
# require 'zenti/fulfillment'
# require 'zenti/shipment'
# require 'zenti/carrier'
# require 'zenti/store'
# require 'zenti/warehouse'
# require 'zenti/product'
# require 'zenti/tag'
# require 'zenti/webhook'

module Zenti

  API_BASE = "https://ssapi.zenti.com/"

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
    def username
      defined? @username and @username or raise(
        ConfigurationError, "Zenti username not configured"
      )
    end

    attr_writer :username

    def password
      defined? @password and @password or raise(
        ConfigurationError, "Zenti password not configured"
      )
    end

    attr_writer :password

    def request method, resource, params = {}
      ss_username = params[:username] || Zenti.username
      ss_password = params[:password] || Zenti.password

      params.except!(:username, :password)

      defined? method or raise(
        ArgumentError, "Request method has not been specified"
      )
      defined? resource or raise(
        ArgumentError, "Request resource has not been specified"
      )
      if method == :get
        headers = {:accept => :json, content_type: :json}.merge({params: params})
        payload = nil
      else
        headers = {:accept => :json, content_type: :json}
        payload = params
      end
      RestClient::Request.new({
                                method: method,
                                url: API_BASE + resource,
                                user: ss_username,
                                password: ss_password,
                                payload: payload ? payload.to_json : nil,
                                headers: headers
                              }).execute do |response, request, result|
        str_response = response.to_str
        str_response.blank? ? '' : JSON.parse(str_response)
      end
    end

    def datetime_format datetime
      datetime.strftime("%Y-%m-%d %T")
    end
  end
end
