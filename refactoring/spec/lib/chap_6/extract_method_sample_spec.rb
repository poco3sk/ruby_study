require 'spec_helper'

describe ExtractMethodSample do
  before do
    stub(@order1 = Object.new).amount { 1.5 }
    stub(@order2 = Object.new).amount { 2.0 }
    @name   = "sample"
    @amount = @order1.amount + @order2.amount
    @klass  = ExtractMethodSample.new(@name)
    @klass.add_order(@order1)
    @klass.add_order(@order2)
  end

  describe "#print_banner" do
    subject { capture(:stdout) { @klass.print_banner } }
    it { expect(subject).to eq(<<-TEXT) }
*************************
***** Csutomer Owes *****
*************************
    TEXT
  end

  describe "#print_details" do
    before do
      @sub_amount = 5.5
    end
    subject { capture(:stdout) { @klass.print_details(@sub_amount) } }
    it { expect(subject).to eq(<<-TEXT) }
name: #{@name}
amount: #{@sub_amount}
    TEXT
  end

  describe "#calculate_outstanding" do
    before do
      @initial_value  = 3.5
      @sub_amount     = @amount + @initial_value
    end

    subject { @klass.calculate_outstanding(@initial_value) }
    it { expect(subject).to eq(@sub_amount) }
  end

  describe '#print_owing' do
    before do
      @previous_amount = 5.0
      interest    = 1.2
      @sub_amount = @previous_amount * interest + @amount
    end
    subject { capture(:stdout) { @klass.print_owing(@previous_amount) } }
    it { expect(subject).to eq(<<-TEXT) }
*************************
***** Csutomer Owes *****
*************************
name: #{@name}
amount: #{@sub_amount}
    TEXT
  end
end
