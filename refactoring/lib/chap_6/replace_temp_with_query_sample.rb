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
    base_price * discount_factor
  end

  # base price
  #
  # @return [Integer]
  def base_price
    @quantity * @item_price
  end

  # discount factor
  #
  # @return [Fixnum]
  def discount_factor
    base_price > 1000 ? 0.95 : 0.98
  end
end