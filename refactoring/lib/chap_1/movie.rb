# レンタルビデオ情報
#
# @attr_reader [String] title タイトル名
# @attr [Integer] price_code 価格コード
class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title
  attr_accessor :price_code

  # new
  #
  # @param [String] title
  # @param [Integer] price_code
  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end

  # レンタル金額計算
  #
  # @param [Integer] days_rented レンタル期間
  # @return [Integer] レンタル金額
  def charge(days_rented)
    result = 0
    case @price_code
    when REGULAR
      result += 2
      result += (days_rented - 2) * 1.5 if days_rented > 2
    when NEW_RELEASE
      result += days_rented * 3
    when CHILDRENS
      result += 1.5
      result += (days_rented - 3) * 1.5 if days_rented > 3
    end

    result
  end
end
