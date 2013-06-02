# レンタルポイント計算 デフォルト
module DefaultPrice
  # レンタルポイント計算
  #
  # @param [Integer] days_rented レンタル期間
  # @return [Integer] レンタルポイント 固定値 1
  def frequent_renter_points(days_rented)
    1
  end
end