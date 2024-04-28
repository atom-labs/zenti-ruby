module Zenti
  class Warehouse < ApiResource
    extend Zenti::APIOperations::Create
    extend Zenti::APIOperations::Retrieve
    extend Zenti::APIOperations::Update

    class << self
      def list(params = {})
        response = Zenti.request(:get, 'warehouses', params)

        return response
      end
    end
  end
end