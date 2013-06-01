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
end
