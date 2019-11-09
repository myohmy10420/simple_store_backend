class Product < ApplicationRecord
  validates_presence_of :name, :content, :price, :inventory
  validates_uniqueness_of :name
end
