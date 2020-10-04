require_relative './part_1_solution.rb'
def find_item_by_name_in_collection(name, collection)
  index = 0

  collection.each do |grocery_item|
    return grocery_item if grocery_item[:item] === name
    index += 1
  end

  nil
end


def consolidate_cart(cart)
  index = 0
  new_cart = []

  cart.each do |grocery_item|
    current_item = find_item_by_name_in_collection(grocery_item[:item], new_cart)
    if current_item
      new_cart_index = 0
      new_cart.each do |new_cart_item|
        if new_cart_item[:item] === current_item[:item]
          new_cart_item[:count] += 1
        end
        new_cart_index += 1
      end
    else
      grocery_item[:count] = 1
      new_cart << grocery_item
    end
    index += 1
  end
  new_cart
end
def apply_coupons(cart, coupons)
  count = 0
  while count < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[count][:item],cart)
    coupon_item = "#{coupons[count][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(coupon_item,cart)
    if cart_item && cart_item[:count] >= coupons[count][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[count][:num]
        cart_item[:count] -= coupons[count][:num]
      else
        cart_item_with_coupon = {
          :item => coupon_item,
          :price => coupons[count][:cost]/coupons[count][:num],
          :clearance => cart_item[:clearance],
          :count => coupons[count][:num]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[count][:num]
      end
    end
    count += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
