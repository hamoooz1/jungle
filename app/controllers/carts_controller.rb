class CartsController < ApplicationController

  def show
    if items_in_cart === 0
      render 'empty_cart'
    end
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_back fallback_location: root_path
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_back fallback_location: root_path
  end

  
  private
  
  def items_in_cart
    cart.count
  end
  
  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
