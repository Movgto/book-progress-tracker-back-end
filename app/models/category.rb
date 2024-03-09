class Category < ApplicationRecord
  has_many :books
  validates_presence_of :name
  validates :name, length: {maximum: 100, minimum: 1}
end
