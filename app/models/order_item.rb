class OrderItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order

  def total_price
    quantity * price
  end
end
