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
    result = 0

    case movie.price_code
    when Movie::REGULAR
      result += 2
      result += (days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      result += days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (days_rented - 3) * 1.5 if days_rented > 3
    end

    result
  end

  # レンタルポイント計算
  #
  # @return [Integer] レンタルポイント
  def frequent_renter_points
    (movie.price_code == Movie::NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end
