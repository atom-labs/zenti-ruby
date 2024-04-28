module Zenti
  class Webhook < ApiResource
    extend Zenti::APIOperations::List

    class << self
      def subscribe(params={})
        response = Zenti.request(:post, 'webhooks/subscribe', params)

        return response
      end

      def unsubscribe(object_id, params={})
        response = Zenti.request(:delete, "webhooks/#{object_id}", params)

        return response
      end
    end
  end
end