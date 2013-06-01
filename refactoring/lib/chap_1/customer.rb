class Customer
  attr_reader :name, :rentals

  # new
  #
  # @param [String] name
  def initialize(name)
    @name     = name
    @rentals  = []
  end

  # レンタル情報の追加
  #
  # @param [Rental] rental
  def add_rental(rental)
    @rentals << rental
  end

  # レンタル情報取得
  #
  # @return [String] レンタル情報
  def statement
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      result += "\t#{element.movie.title}\t#{element.charge}\n"
    end

    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
  end

  # レンタル合計金額取得
  #
  # @return [Integer] 合計金額
  def total_charge
    @rentals.inject(0) { |sum, rental| sum += rental.charge }
  end

  # レンタルポイント合計取得
  #
  # @return [Integer] ポイント合計
  def total_frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum += rental.frequent_renter_points }
  end
end
