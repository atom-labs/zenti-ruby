# frozen_string_literal: true

module Zenti
  class Order < ApiResource
    extend Zenti::APIOperations::List
    extend Zenti::APIOperations::Create
    extend Zenti::APIOperations::Retrieve
    extend Zenti::APIOperations::Delete

    class << self
      def create_label(params = {})
        response = Zenti.request(:post, 'orders/createlabelfororder', params)

        response
      end

      def assign_tag(params = {})
        response = Zenti.request(:post, 'orders/addtag', params)

        response
      end

      def remove_tag(params = {})
        response = Zenti.request(:post, 'orders/removetag', params)

        response
      end

      def create_bulk(params = {})
        response = Zenti.request(:post, 'orders/createorders', params)

        response
      end

      # params: { [:username], [:password], input: [ {:order_number, ... }, { :order_number, ... } ] }
      # todo: complete in future phase
      # def create_update_orders params
      #     Zenti.request(:post, "orders/createorders", params)
      # end
    end
  end
end
