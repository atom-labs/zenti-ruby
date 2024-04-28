module Zenti
  class Tag < ApiResource

    class << self
      def list(params = {})
        response = Zenti.request(:get, 'accounts/listtags', params)

        return response
      end
    end
  end
end