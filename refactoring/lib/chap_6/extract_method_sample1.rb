# chap.6 Extract Method用クラス その1
#
# @attr_reader [String] name
# @attr_reader [Order] orders
class ExtractMethodSample1
  attr_reader :name, :orders

  # new
  #
  # @param [String] name
  def initialize(name)
    @name   = name
    @orders = []
  end

  # orders に order 追加
  #
  # @param [Order] order
  # @return [void]
  def add_order(order)
    @orders << order
  end

  # 未払い情報出力
  #
  # @return [void]
  def print_owing
    outstanding = 0.0

    puts "*************************"
    puts "***** Csutomer Owes *****"
    puts "*************************"

    @orders.each do |order|
      outstanding += order.amount
    end

    puts "name: #{@name}"
    puts "amount: #{outstanding}"
  end
end