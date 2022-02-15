class VaildDaysJob < ApplicationJob
  queue_as :default

  def perform(order)
    order.invalidate!  
  end
end
