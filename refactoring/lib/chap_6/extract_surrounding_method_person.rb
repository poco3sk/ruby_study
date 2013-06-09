# ExtractSurroundingMethod Person
#
# @attr_reader [ExtractSurroundingMethodPerson] mother
# @attr_reader [Array<ExtractSurroundingMethodPerson>] childres
# @attr_reader [String] name
class ExtractSurroundingMethodPerson
  attr_reader :mother, :children, :name

  # new
  #
  # @param [String] name
  # @param [Date] date_of_birth
  # @param [Date] date_of_death
  # @param [ExtractSurroundingMethodPerson] mother
  def initialize(name, date_of_birth, date_of_death = nil, mother = nil)
    @name, @mother = name, mother
    @date_of_birth, @date_of_death = date_of_birth, date_of_death
    @children = []
    @mother.add_child(self) if @mother
  end

  # add child
  #
  # @param [ExtractSurroundingMethodPerson] child
  # @return [void]
  def add_child(child)
    @children << child
  end

  # number of living descendants
  #
  # @return [Integer]
  def number_of_living_descendants
    count_of_descendants_match { |descendant| descendant.alive? }
  end

  # number of descendants named
  #
  # @param [String] name
  # @return [Integer]
  def number_of_descendants_named(name)
    count_of_descendants_match { |descendant| descendant.name == name }
  end

  # person alive?
  #
  # @return [TrueClass, FalseClass]
  def alive?
    @date_of_death.nil?
  end

  protected
  def count_of_descendants_match(&block)
    children.inject(0) do |count, child|
      count += 1 if yield child
      count + child.number_of_descendants_named(name)
    end
  end
end