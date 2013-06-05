# select
#
# @attr_reader [Array<Integer>] options
class Select
  attr_reader :options

  # options
  #
  # @return [Array<Integer>] options
  def options
    @options ||= []
  end

  # add_options
  #
  # @param [Integer] option
  # @return [void]
  def add_option(option)
    options << option
  end
end