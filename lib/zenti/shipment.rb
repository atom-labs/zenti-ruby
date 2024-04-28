module Zenti
  class Shipment < ApiResource
    extend Zenti::APIOperations::List

    class << self
      def get_rates(params = {})
        Zenti.request(:post, "shipments/getrates", params)
      end

      def create_label(params = {})
        Zenti.request(:post, 'shipments/createlabel', params)
      end

      def void_label(params = {})
        Zenti.request(:post, 'shipments/voidlabel', params)
      end
    end
  end
end