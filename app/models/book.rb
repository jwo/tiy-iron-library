class Book < ActiveRecord::Base
  belongs_to :author

  validates :title, :price, :author_id, presence: true
end
