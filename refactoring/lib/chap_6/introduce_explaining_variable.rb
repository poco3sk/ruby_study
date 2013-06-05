# IntroduceExplainingVariable
#
# @attr_reader [Integer] quantity
# @attr_reader [Integer] item_price
class IntroduceExplainingVariable
  attr_reader :quqntity, :item_price

  # @param [Integer] quantity
  # @param [Integer] item_price
  def initialize(quantity, item_price)
    @quantity = quantity
    @item_price = item_price
  end

  # price
  # 基本価格 - 数量割引 ＋ 配達料
  #
  # @return [Fixnum]
  def price
    return @quantity * @item_price -
      [0, @quantity - 500].max * @item_price * 0.05 +
      [@quantity * @item_price * 0.1, 100.0].min
  end
end