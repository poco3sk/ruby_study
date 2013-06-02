# レンタルビデオ NEW_RELEASE
class NewReleasePrice
  # レンタル金額計算
  #
  # @param [Integer] days_rented レンタル期間
  # @return [Integer] レンタル金額
  def charge(days_rented)
    days_rented * 3
  end

  # レンタルポイント計算
  #
  # @param [Integer] days_rented レンタル期間
  # @return [Integer] レンタルポイント 固定値 1
  def frequent_renter_points(days_rented)
    days_rented > 1 ? 2 : 1
  end
end