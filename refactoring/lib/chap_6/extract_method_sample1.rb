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
    print_banner
    print_details(calculate_outstanding)
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

  # 支払い計算
  #
  # @return [Fixnum] outstanding
  def calculate_outstanding
    @orders.inject(0.0) { |sum, order| sum += order.amount }
  end
end