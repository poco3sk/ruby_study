# ReplaceTempWithQuerySample
#
# @attr_reader [Integer] quantity
# @attr_reader [Integer] item_price
class ReplaceTempWithQuerySample
  attr_reader :quantity, :item_price

  # new
  #
  # @param [Integer] quantity
  # @param [Integer] item_price
  def initialize(quantity, item_price)
    @quantity   = quantity
    @item_price = item_price
  end

  # price
  #
  # @return [Fixnum]
  def price
    base_price = @quantity * @item_price

    if base_price > 1000
      discount_factor = 0.95
    else
      discount_factor = 0.98
    end

    base_price * discount_factor
  end
end