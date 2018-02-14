class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.line_items.reduce(0) { |sum, obj| sum + (obj.item.price * obj.quantity) }
  end

  def add_item(item_id, quantity = 1)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
      line_item
    else
      self.line_items.build(item_id: item_id, quantity:quantity)
    end
  end

  def checkout_cart
    self.status = "submitted"
    inventory_update
    # binding.pry
    self.save
  end

  def inventory_update
    self.line_items.each do |l|
      # saves the update directly to the db
      # Model.update_counters(id of instance being updated, column: new value)
      Item.update_counters(l.item_id, inventory: -l.quantity)
    end
  end

end
