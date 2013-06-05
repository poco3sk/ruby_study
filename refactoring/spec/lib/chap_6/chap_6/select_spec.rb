require 'spec_helper'

describe Select do
  before do
    @klass = Select.new
  end

  describe ".with_select" do
    before do
      @seed = 1999
    end

    subject { Select.with_option(@seed) }
    it { expect(subject.class).to eq(Select) }
    it { expect(subject.options).to eq([@seed]) }
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

  describe "method chain" do
    before do
      @seed = [1999, 2000, 2001, 2002]
    end

    subject {
      Select.with_option(@seed[0]).add_option(@seed[1]).
        add_option(@seed[2]).add_option(@seed[3])
    }
    it { expect(subject.options).to eq(@seed) }
  end
end