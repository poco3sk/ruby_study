require 'spec_helper'

describe Select do
  before do
    @klass = Select.new
  end

  describe "#add_option" do
    before do
      @seed = [1999, 2000, 2001, 2002]
      @seed.each do |seed|
        @klass.add_option seed
      end
    end

    it { expect(@klass.options).to eq(@seed) }
  end
end