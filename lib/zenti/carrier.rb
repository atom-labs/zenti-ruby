module Zenti
  class Carrier < ApiResource
    extend Zenti::APIOperations::List

    class << self
      def list_services(params = {})
        response = Zenti.request(:get, 'carriers/listservices', params)
        return response
      end
    end
  end
end