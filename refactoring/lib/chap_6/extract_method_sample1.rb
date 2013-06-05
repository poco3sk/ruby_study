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

    print_banner

    @orders.each do |order|
      outstanding += order.amount
    end

    print_details(outstanding)
  end

  # バナー出力
  #
  # @return [void]
  def print_banner
    puts "*************************"
    puts "***** Csutomer Owes *****"
    puts "*************************"
  end

  # 詳細情報表示
  #
  # @param [Fixnum] outstanding
  # @return [void]
  def print_details(outstanding)
    puts "name: #{@name}"
    puts "amount: #{outstanding}"
  end
end