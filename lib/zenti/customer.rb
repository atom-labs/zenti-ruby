module Zenti
  class Customer < ApiResource
    extend Zenti::APIOperations::List
    extend Zenti::APIOperations::Retrieve
  end
end