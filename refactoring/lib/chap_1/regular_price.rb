# レンタルビデオ REGULAR
class RegularPrice
  # レンタル金額計算
  #
  # @param [Integer] days_rented レンタル期間
  # @return [Integer] レンタル金額
  def charge(days_rented)
    result = 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    result
  end
end