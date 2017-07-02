class Order < ApplicationRecord
  belongs_to :user
  belongs_to :ticket_type
  validate :avaiable_quantity

  def avaiable_quantity
  	if quantity > ticket_type.max_quantity
  		errors.add(:quantity, "must less than ticket's max quantity")
  	end
  end

  def total_price
  	ticket_type.price * quantity
  end
end
