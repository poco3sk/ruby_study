# select
#
# @attr_reader [Array<Integer>] options
class Select
  attr_reader :options

  # option の初期値を設定し、Selectインスタンスを返す
  #
  # @param [Integer] option
  # @return [Select]
  def self.with_option(option)
    select  = Select.new
    select.options << option
    select
  end

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
    self
  end
end