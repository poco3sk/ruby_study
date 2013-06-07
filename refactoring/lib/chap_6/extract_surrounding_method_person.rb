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
    children.inject(0) do |count, child|
      count += 1 if child.alive?
      count + child.number_of_living_descendants
    end
  end

  # number of descendants named
  #
  # @param [String] name
  # @return [Integer]
  def number_of_descendants_named(name)
    children.inject(0) do |count, child|
      count += 1 if child.name == name
      count + child.number_of_descendants_named(name)
    end
  end

  # person alive?
  #
  # @return [TrueClass, FalseClass]
  def alive?
    @date_of_death.nil?
  end
end