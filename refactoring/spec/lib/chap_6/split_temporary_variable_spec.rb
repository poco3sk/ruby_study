require 'spec_helper'

describe SplitTemporaryVariable do
  describe '#distance_traveled' do
    context "secondary_timeが発生しない場合" do
      before do
        @delay  = 1.0
        @klass  = SplitTemporaryVariable.new(1, 1, 1, @delay)
      end

      subject { @klass.distance_traveled(@delay) }
      it { expect(subject).to eq(0.5) }
    end

    context "secondary_timeが発生する場合" do
      before do
        @delay  = 1.0
        @time   = 2.0
        @klass  = SplitTemporaryVariable.new(1, 1, 1, @delay)
      end

      subject { @klass.distance_traveled(@time) }
      it { expect(subject).to eq(11.5) }
    end
  end
end
