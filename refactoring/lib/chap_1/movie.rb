# レンタルビデオ情報
#
# @attr_reader [String] title タイトル名
# @attr_reader [Integer] price_code 価格コード
class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title, :price_code, :price

  # new
  #
  # @param [String] title
  # @param [Integer] price_code
  def initialize(title, the_price_code)
    @title, self.price_code = title, the_price_code
  end

  # price_code custom setter
  #
  # priceもprice_codeによって更新する
  # @param [Integer] value 価格コード
  # @return [void]
  def price_code=(value)
    @price_code = value
    @price = case @price_code
             when REGULAR; RegularPrice.new
             when NEW_RELEASE; NewReleasePrice.new
             when CHILDRENS; ChildrensPrice.new
             end
  end

  # レンタル金額計算
  #
  # @param [Integer] days_rented レンタル期間
  # @return [Integer] レンタル金額
  def charge(days_rented)
    @price.charge(days_rented)
  end

  # レンタルポイント計算
  #
  # @param [Integer] days_rented レンタル期間
  # @return [Integer] レンタルポイント
  def frequent_renter_points(days_rented)
    (@price_code == NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end
