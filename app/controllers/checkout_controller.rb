class CheckoutController < ApplicationController
  def create
    #load up cart
    x = Product.find(session[:shopping_cart])

    if x.nil?
      redirect_to root_path
      return
    end

    x.each do |y|
          #establish a connectionwith stripe
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      line_items: [
        {
          name: y.name,
          description: y.description,
          amount: (y.price * 100).to_i,
          currency: "cad",
          quantity: 1
        },
        {
          name: "GST",
          description: "Goods And Services Tax",
          amount: (y.price * 0.05.to_i),
          currency: "cad",
          quantity: 1
        }
      ]
    )
    end

    respond_to do |format|
      format.js
    end
  end

  def success

  end

  def cancel

  end
end
