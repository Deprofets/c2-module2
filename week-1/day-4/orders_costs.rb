# frozen_string_literal: true

class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    orders.reduce(0) do |total, order|
      total + order.keys.reduce(0) do |subtotal, item_name|
        subtotal + @menu[item_name] * order[item_name]
      end
    end
  end
end
