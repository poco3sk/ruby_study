# SplitTemporaryVariable
#
# @attr_reader [Integer] primary_force
# @attr_reader [Integer] secondary_force
# @attr_reader [Integer] mass
# @attr_reader [Fixnum] delay
class SplitTemporaryVariable
  attr_reader :primary_force, :secondary_force, :mass, :delay

  # new
  #
  # @param [Integer] primary_force
  # @param [Integer] secondary_force
  # @param [Integer] mass
  # @param [Fixnum] delay
  def initialize(primary_force, secondary_force, mass, delay)
    @primary_force    = primary_force
    @secondary_force  = secondary_force
    @mass   = mass
    @delay  = delay
  end

  # distance_traveled
  #
  # @param [Fixnum] time
  # @return [Fixnum]
  def distance_traveled(time)
    acc = @primary_force / @mass
    primary_time = [time, @delay].min
    result = 0.5 * acc * primary_time * primary_time
    secondary_time = time - @delay

    if secondary_time > 0
      primary_val = acc * @delay
      acc = (@primary_force + @secondary_force) / @mass
      result += primary_val * secondary_time + 5 * acc * secondary_time * secondary_time
    end

    result
  end
end