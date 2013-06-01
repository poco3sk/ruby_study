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
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      frequent_renter_points += element.frequent_renter_points

      result += "\t#{element.movie.title}\t#{element.charge}\n"
      total_amount += element.charge
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
  end
end
