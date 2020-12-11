# what does a cash register do? it rings things up
class CashRegister
  attr_accessor :items, :discount, :total, :last_item

  def initialize(discount = 0.0)
    @total = 0.0
    @discount = discount
    @items = []
  end

  def apply_discount
    unless @discount.zero?
      @total -= @total * @discount * 0.01
      return "After the discount, the total comes to $#{@total.to_i}."
    end

    'There is no discount to apply.'
  end

  def add_item(title, price, qty = 1)
    qty.times do
      @items << title
      @total += price
    end
    @last_item = [price, qty]
  end

  def void_last_transaction
    lasts = 0.0
    @last_item[1].times do
      @items.pop
      lasts += @last_item[0]
    end
    @total = 0.0 if lasts == []
    @total -= lasts
  end
end
