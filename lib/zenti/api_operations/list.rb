module Zenti
  module APIOperations
    module List

      def list(params = {})
        response = Zenti.request(:get, class_name.downcase.pluralize, params)

        return response
      end
    end
  end
end