module Zenti
  class Product < ApiResource
    extend Zenti::APIOperations::List
    extend Zenti::APIOperations::Retrieve
    extend Zenti::APIOperations::Update
  end
end 