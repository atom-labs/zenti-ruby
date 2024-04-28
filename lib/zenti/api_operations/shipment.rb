module Zenti
  module APIOperations
    module Shipment

      def mark_as_shipped(params = {})
        Zenti.request(:post, 'orders/markasshipped', params)
      end
    end
  end
end
