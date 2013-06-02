# レンタルビデオ情報
#
# @attr_reader [String] title タイトル名
# @attr_reader [RegularPrice, NewReleasePrice, ChildrensPrice] レンタルビデオモデル
class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title, :price

  # new
  #
  # @param [String] title
  # @param [RegularPrice, NewReleasePrice, ChildrensPrice] レンタルビデオモデル
  def initialize(title, price)
    @title, @price = title, price
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
    @price.frequent_renter_points(days_rented)
  end
end
