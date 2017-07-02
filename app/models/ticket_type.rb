class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :orders
  validates :price, :max_quantity, numericality: true

  def avaiable_quantity
  	sell = orders.to_a.sum{|item| item.quantity}
  	self.max_quantity - sell
  end

  def avaiable_select
  	max = avaiable_quantity
  	max > 10 ? 10 : max
  end
end
