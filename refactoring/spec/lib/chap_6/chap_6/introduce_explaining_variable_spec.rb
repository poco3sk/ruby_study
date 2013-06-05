require 'spec_helper'

describe IntroduceExplainingVariable do
  describe '#price' do
    context "数量割引なし、配送料固定の場合" do
      before do
        @quantity   = 2
        @item_price = 600
        @expect     = 1300
        @klass = IntroduceExplainingVariable.new(@quantity, @item_price)
      end

      it { expect(@klass.price).to eq(@expect) }
    end

    context "数量割引あり、配送料固定の場合" do
      before do
        @quantity   = 600
        @item_price = 10
        @expect     = 6050
        @klass = IntroduceExplainingVariable.new(@quantity, @item_price)
      end

      it { expect(@klass.price).to eq(@expect) }
    end

    context "数量割引なし、配送料少ない場合" do
      before do
        @quantity   = 5
        @item_price = 10
        @expect     = 55
        @klass = IntroduceExplainingVariable.new(@quantity, @item_price)
      end

      it { expect(@klass.price).to eq(@expect) }
    end
  end
end
