# Customer 情報
#
# @attr_reader [String] name Customer name
# @attr_reader [Array<Rental>] rentals レンタル情報
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
  # @return [void]
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

  # レンタル情報取得 HTML版
  #
  # @return [String] レンタル情報 HTML
  def html_statement
    result = "<h1>Rental Record for <em>#{@name}</em></h1>\n"

    @rentals.each do |element|
      result += "<p>#{element.movie.title}\t#{element.charge}</p><br />\n"
    end

    result += "<p>You owe <em>#{total_charge}</em></p>\n"
    result += "<p>On this rental you earned " +
              "<em>#{total_frequent_renter_points}</em>" +
              " frequent renter points</p>"
  end

  private
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
