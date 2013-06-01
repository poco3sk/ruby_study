require 'spec_helper'

describe ChildrensPrice do
  before do
    @klass = ChildrensPrice.new
  end

  describe '#charge' do
    context "days_rented が 3 の場合" do
      subject { @klass.charge(3) }
      it { expect(subject).to eq(1.5) }
    end

    context "days_rented が 6 の場合" do
      subject { @klass.charge(6) }
      it { expect(subject).to eq(6) }
    end
  end
end
