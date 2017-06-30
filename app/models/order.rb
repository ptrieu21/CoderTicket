class Order < ApplicationRecord
  belongs_to :user
  belongs_to :ticket_type

  def total_price
  	ticket_type.price * quantity
  end
end
