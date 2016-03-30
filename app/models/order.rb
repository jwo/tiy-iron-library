class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :books, through: :order_items

  def description
    "Order ##{id}: #{order_items.map{|order_item| order_item.book.title}.join(', ')}"
  end

  def total_price
    order_items.map{|order_item| order_item.total_price}.sum
  end

  def total_price_in_cents
    (total_price * 100).to_i
  end

end
