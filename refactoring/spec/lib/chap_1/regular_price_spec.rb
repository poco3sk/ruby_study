require 'spec_helper'

describe RegularPrice do
  before do
    @klass = RegularPrice.new
  end

  describe '#charge' do
    context "days_rented が 2 の場合" do
      subject { @klass.charge(2) }
      it { expect(subject).to eq(2) }
    end

    context "days_rented が 4 の場合" do
      subject { @klass.charge(4) }
      it { expect(subject).to eq(5) }
    end
  end
end
