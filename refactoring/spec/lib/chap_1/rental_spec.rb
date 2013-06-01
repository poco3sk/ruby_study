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

  describe '#charge' do
    context "Movie::REGULAR" do
      before do
        @movie  = stub(Movie)
        stub(@movie).price_code { Movie::REGULAR }
      end

      context "days_rented が 2以下の場合" do
        before do
          @actual = Rental.new(@movie, 2)
        end

        subject { @actual.charge }
        it { expect(subject).to eq(2) }
      end

      context "days_rented が 2より大きい場合" do
        before do
          @actual = Rental.new(@movie, 3)
        end

        subject { @actual.charge }
        it { expect(subject).to eq(3.5) }
      end
    end

    context "Movie::NEW_RELEASE" do
      before do
        @movie  = stub(Movie)
        stub(@movie).price_code { Movie::NEW_RELEASE }
      end

      context "days_rented が 2の場合" do
        before do
          @actual = Rental.new(@movie, 2)
        end

        subject { @actual.charge }
        it { expect(subject).to eq(6) }
      end

      context "days_rented が 4の場合" do
        before do
          @actual = Rental.new(@movie, 4)
        end

        subject { @actual.charge }
        it { expect(subject).to eq(12) }
      end
    end

    context "Movie::CHILDRENS" do
      before do
        @movie  = stub(Movie)
        stub(@movie).price_code { Movie::CHILDRENS }
      end

      context "days_rented が 3以下の場合" do
        before do
          @actual = Rental.new(@movie, 3)
        end

        subject { @actual.charge }
        it { expect(subject).to eq(1.5) }
      end

      context "days_rented が 3より大きい場合" do
        before do
          @actual = Rental.new(@movie, 4)
        end

        subject { @actual.charge }
        it { expect(subject).to eq(3) }
      end
    end
  end
end
