require 'spec_helper'

describe ExtractSurroundingMethodPerson do
  describe '#add_child' do
    before do
      @mother = ExtractSurroundingMethodPerson.new("Alice", Date.new, nil, nil)
      @child  = ExtractSurroundingMethodPerson.new("Tom", Date.new, nil, nil)
      @mother.add_child(@child)
    end

    it { expect(@mother.children.count).to eq(1) }
  end

  describe '#number_of_living_descendants' do
    context 'date_of_death nil' do
      before do
        @mother = ExtractSurroundingMethodPerson.new("Alice", Date.new, nil, nil)
        3.times { ExtractSurroundingMethodPerson.new("Tom", Date.new, nil, @mother) }
      end

      subject { @mother.number_of_living_descendants }
      it { expect(subject).to eq(3) }
    end

    context 'date_of_death not nil' do
      before do
        @mother = ExtractSurroundingMethodPerson.new("Alice", Date.new, nil, nil)
        [nil, nil, Date.new].each do |date_of_death|
          ExtractSurroundingMethodPerson.new("Tom", Date.new, date_of_death, @mother)
        end
      end

      subject { @mother.number_of_living_descendants }
      it { expect(subject).to eq(2) }
    end
  end

  describe 'number_of_descendants_named' do
    before do
      @mother = ExtractSurroundingMethodPerson.new("Alice", Date.new, nil, nil)
      @name   = "Tom"
      [@name, "Sam", "Joy"].each do |name|
        ExtractSurroundingMethodPerson.new(name, Date.new, Date.new, @mother)
      end
    end

    subject { @mother.number_of_descendants_named(@name) }
    it { expect(subject).to eq(1) }
  end

  describe '#alive?' do
    context 'date_of_death nil' do
      before do
        @person = ExtractSurroundingMethodPerson.new("Alice", Date.new, nil, nil)
      end

      subject { @person.alive? }
      it { expect(subject).to be_true }
    end

    context 'date_of_death not nil' do
      before do
        @person = ExtractSurroundingMethodPerson.new("Alice", Date.new, Date.new, nil)
      end

      subject { @person.alive? }
      it { expect(subject).to be_false }
    end
  end
end
