class AddUserRefToBooks < ActiveRecord::Migration[7.1]
  def change
    add_reference :books, :user, foreign_key: true
  end
end
