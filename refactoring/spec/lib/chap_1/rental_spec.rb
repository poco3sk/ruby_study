require 'spec_helper'

describe Rental do
  describe 'new' do
    before do
      @movie        = stub(Movie)
      @days_rented  = 0
      @actual       = Rental.new(@movie, @days_rented)
    end

    it { expect(@actual.movie).to eq(@movie) }
    it { expect(@actual.days_rented).to eq(@days_rented) }
  end
end
