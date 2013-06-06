require 'spec_helper'

describe ReplaceTempWithQuerySample do
  describe '#price' do
    context "定価で1000円を越える場合" do
      before do
        @quantity   = 2
        @item_price = 600
        @expect     = @quantity * @item_price * 0.95
        @klass      = ReplaceTempWithQuerySample.new(@quantity, @item_price)
      end

      subject { @klass.price }
      it { expect(subject).to eq(@expect) }
    end

    context "定価で1000円を越えない場合" do
      before do
        @quantity   = 2
        @item_price = 500
        @expect     = @quantity * @item_price * 0.98
        @klass      = ReplaceTempWithQuerySample.new(@quantity, @item_price)
      end

      subject { @klass.price }
      it { expect(subject).to eq(@expect) }
    end
  end
end
