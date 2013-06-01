# レンタル情報
#
# @attr_reader [Movie] movie レンタルビデオ情報
# @attr_reader [Integer] days_rented レンタル期間
class Rental
  attr_reader :movie, :days_rented

  # new
  #
  # @param [Movie] movie
  # @param [Integer] days_rented
  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  # レンタル金額計算
  #
  # @return [Integer] レンタル金額
  def charge
    @movie.charge(@days_rented)
  end

  # レンタルポイント計算
  #
  # @return [Integer] レンタルポイント
  def frequent_renter_points
    (@movie.price_code == Movie::NEW_RELEASE && @days_rented > 1) ? 2 : 1
  end
end
