# chap.6 Extract Method用クラス
#
# @attr_reader [String] name
# @attr_reader [Order] orders
class ExtractMethodSample
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
  # @param [Fixnum] previous_amount
  # @return [void]
  def print_owing(previous_amount)
    outstainding = previous_amount * 1.2
    print_banner
    print_details(calculate_outstanding(outstainding))
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
  # @param [Fixnum] initial_value
  # @return [Fixnum] outstanding
  def calculate_outstanding(initial_value)
    @orders.inject(initial_value) { |sum, order| sum += order.amount }
  end
end