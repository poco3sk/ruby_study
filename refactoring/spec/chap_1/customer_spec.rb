require 'spec_helper'

describe Customer do
  describe 'new' do
    before do
      @name   = "name"
      @actual = Customer.new(@name)
    end

    it { expect(@actual.name).to eq(@name) }
  end

  describe '#add_rental' do
    before do
      @name     = "name"
      @rentals  = [ stub(Rental), stub(Rental) ]
      @actual   = Customer.new(@name)
      @rentals.each { |rental| @actual.add_rental(rental) }
    end

    subject { @actual.rentals }
    it { expect(subject).to eq(@rentals) }
  end

  describe '#statement' do
    before do
      @name     = "name"
      @rentals  = [ stub(Rental), stub(Rental) ]
      @actual   = Customer.new(@name)
    end

    context "rentals 1" do
      before do
        @actual   = Customer.new("name")
        @actual.add_rental Rental.new(Movie.new("title1", Movie::REGULAR), 2)
        @actual.add_rental Rental.new(Movie.new("title2", Movie::NEW_RELEASE), 3)
      end

      subject { @actual.statement }
      it { expect(subject).to match(/Rental Record for name/) }
      it { expect(subject).to match(/title1\t2/) }
      it { expect(subject).to match(/You earned 3 frequent renter points/) }
    end
  end
end
