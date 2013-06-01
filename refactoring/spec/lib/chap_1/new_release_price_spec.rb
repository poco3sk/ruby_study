require 'spec_helper'

describe NewReleasePrice do
  before do
    @klass = NewReleasePrice.new
  end

  describe '#charge' do
    context "days_rented が 2 の場合" do
      subject { @klass.charge(2) }
      it { expect(subject).to eq(6) }
    end

    context "days_rented が 4 の場合" do
      subject { @klass.charge(4) }
      it { expect(subject).to eq(12) }
    end
  end
end
