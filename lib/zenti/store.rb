module Zenti
  class Store < ApiResource
    extend Zenti::APIOperations::List
    extend Zenti::APIOperations::Retrieve
    extend Zenti::APIOperations::Update

    class << self
      def list(params = {})
        response = Zenti.request(:get, 'stores', params)

        return response
      end
    end
  end
end