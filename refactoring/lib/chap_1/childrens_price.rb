# レンタルビデオ CHILDRENS
class ChildrensPrice
  include DefaultPrice

  # レンタル金額計算
  #
  # @param [Integer] days_rented レンタル期間
  # @return [Integer] レンタル金額
  def charge(days_rented)
    result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end