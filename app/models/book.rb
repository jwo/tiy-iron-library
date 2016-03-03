class Book < ActiveRecord::Base
  belongs_to :author

  validates :title, :price, :author_id, presence: true
  validates_numericality_of :price, :greater_than => 0, :less_than => 1000
  validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/

end
