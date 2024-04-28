module Zenti
  module APIOperations
    module Update

      def update(object_id, params = {})
        Zenti.request(:put, "#{class_name.downcase.pluralize}/#{object_id}", params)
      end
    end
  end
end