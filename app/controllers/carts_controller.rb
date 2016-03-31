class CartsController < ApplicationController
  def view
    @order = Order.find_by status: 'cart', user_id: @current_user.id
  end

  def add_to_cart
    @book = Book.find_by id: params[:book_id]

    order = Order.find_by status: 'cart', user_id: @current_user.id
    if order.nil?
      order = Order.new
      order.user = @current_user
      order.purchased_at = Time.now
      order.save!
    end

    order_item = OrderItem.find_by order_id: order.id, book_id: @book.id
    if order_item.present?
      order_item.quantity += 1
    else
      order_item = OrderItem.new
      order_item.order = order
      order_item.book = @book
      order_item.price = @book.price
      order_item.shipping_cost = @book.shipping_cost
      order_item.quantity = 1
    end

    if order_item.quantity <= @book.inventory
      @book.inventory -= order_item.quantity
      @book.save
      order_item.save!
    end

    redirect_to cart_path
  end

  def remove_from_cart
    @order = Order.find_by status: 'cart', user_id: @current_user.id
    @book = Book.find_by id: params[:book_id]
    order_item = OrderItem.find_by order_id: @order.id, book_id: @book.id
    @book.inventory += order_item.quantity
    @book.save
    order_item.destroy
    redirect_to cart_path
  end

  def process_payment
    @order = Order.find_by status: 'cart', user_id: @current_user.id

    card_token = params[:stripeToken]

    Stripe.api_key = "sk_test_wHzmUvlgjN7NWOsoIRsR2sJT"

    Stripe::Charge.create(
      :amount => @order.total_price_in_cents,
      :currency => "usd",
      :source => card_token,
      :description => @order.description
    )

    @order.update status: 'pending'

    redirect_to receipt_path(id: @order.id)
  end

  def receipt
    @order = Order.find_by id: params[:id]

    ReceiptMailer.send_receipt(@order, @current_user).deliver_now
  end
end
