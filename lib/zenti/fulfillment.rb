module Zenti
  class Fulfillment < ApiResource
    extend Zenti::APIOperations::List

    class << self
      def retrieve(object_id, params = {})
        response = Zenti.request(:get, "#{class_name.downcase.pluralize}?fulfillmentId=#{object_id}", params)
        if response.is_a?(Hash) && response["fulfillments"].is_a?(Array)
          response["fulfillments"].first
        else
          response
        end
      end
    end
  end
end