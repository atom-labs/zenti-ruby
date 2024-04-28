module Zenti
  module APIOperations
    module Delete

      def delete(object_id, params = {})
        Zenti.request(:delete, "#{class_name.downcase.pluralize}/#{object_id}", params)
      end

    end
  end
end