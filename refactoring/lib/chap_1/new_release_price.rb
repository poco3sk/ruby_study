# レンタルビデオ NEW_RELEASE
class NewReleasePrice
  # レンタル金額計算
  #
  # @param [Integer] days_rented レンタル期間
  # @return [Integer] レンタル金額
  def charge(days_rented)
    days_rented * 3
  end
end