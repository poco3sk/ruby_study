require 'spec_helper'

describe ExtractMethodSample1 do
  before do
    stub(@order1 = Object.new).amount { 1.5 }
    stub(@order2 = Object.new).amount { 2.0 }
    @name   = "sample"
    @amount = @order1.amount + @order2.amount
    @klass  = ExtractMethodSample1.new(@name)
    @klass.add_order(@order1)
    @klass.add_order(@order2)
  end

  describe '#print_owing' do
    subject { capture(:stdout) { @klass.print_owing } }
    it { expect(subject).to eq(<<-TEXT) }
*************************
***** Csutomer Owes *****
*************************
name: #{@name}
amount: #{@amount}
    TEXT
  end
end
