class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates_presence_of :title, :author, :total_chapters, :current_chapter, :category_id, :user_id
end
