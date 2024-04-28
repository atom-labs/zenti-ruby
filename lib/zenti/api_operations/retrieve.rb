module Zenti
  module APIOperations
    module Retrieve

      def retrieve(object_id, params = {})
        response = Zenti.request(:get, "#{class_name.downcase.pluralize}/#{object_id}", params)
        return response
      end
    end
  end
end