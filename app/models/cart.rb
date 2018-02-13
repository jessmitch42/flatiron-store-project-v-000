class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.items.reduce(0) { |sum, obj| sum + obj.price }
  end

  def add_item(item_id, quantity = 1)
    existing = LineItem.find_by(cart_id: self.id, item_id: item_id)
    if existing
      existing.update(quantity:quantity)
      existing
    else
      li = LineItem.new(quantity: quantity, cart_id: self.id, item_id: item_id)
    end
  end

  # def current_cart(current_user)
  #   Cart.find(user_id: current_user.id, status: "open")
  # end


end
