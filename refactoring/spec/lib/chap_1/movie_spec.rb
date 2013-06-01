require 'spec_helper'

describe Movie do
  describe 'new' do
    before do
      @title      = "title"
      @price_code = Movie::REGULAR
      @actual     = Movie.new(@title, @price_code)
    end

    it { expect(@actual.title).to eq(@title) }
    it { expect(@actual.price_code).to eq(@price_code) }
  end

  describe '#charge' do
    context "REGULAR" do
      before do
        @actual = Movie.new(@title, Movie::REGULAR)
      end

      context "days_rented が 2以下の場合" do
        subject { @actual.charge(2) }
        it { expect(subject).to eq(2) }
      end

      context "days_rented が 2より大きい場合" do
        subject { @actual.charge(3) }
        it { expect(subject).to eq(3.5) }
      end
    end

    context "NEW_RELEASE" do
      before do
        @actual = Movie.new(@title, Movie::NEW_RELEASE)
      end

      context "days_rented が 2の場合" do
        subject { @actual.charge(2) }
        it { expect(subject).to eq(6) }
      end

      context "days_rented が 4の場合" do
        subject { @actual.charge(4) }
        it { expect(subject).to eq(12) }
      end
    end

    context "CHILDRENS" do
      before do
        @actual = Movie.new(@title, Movie::CHILDRENS)
      end

      context "days_rented が 3以下の場合" do
        subject { @actual.charge(3) }
        it { expect(subject).to eq(1.5) }
      end

      context "days_rented が 3より大きい場合" do
        subject { @actual.charge(4) }
        it { expect(subject).to eq(3) }
      end
    end
  end

  describe "#frequent_renter_points" do
    context "REGULAR" do
      before do
        @actual = Movie.new(:title, Movie::REGULAR)
      end

      context "days_rented が 1の場合" do
        subject { @actual.frequent_renter_points(1) }
        it { expect(subject).to eq(1) }
      end

      context "days_rented が 2の場合" do
        subject { @actual.frequent_renter_points(2) }
        it { expect(subject).to eq(1) }
      end
    end

    context "NEW_RELEASE" do
      before do
        @actual = Movie.new(:title, Movie::NEW_RELEASE)
      end

      context "days_rented が 1の場合" do
        subject { @actual.frequent_renter_points(1) }
        it { expect(subject).to eq(1) }
      end

      context "days_rented が 2の場合" do
        subject { @actual.frequent_renter_points(2) }
        it { expect(subject).to eq(2) }
      end
    end

    context "CHILDRENS" do
      before do
        @actual = Movie.new(:title, Movie::CHILDRENS)
      end

      context "days_rented が 1の場合" do
        subject { @actual.frequent_renter_points(1) }
        it { expect(subject).to eq(1) }
      end

      context "days_rented が 2の場合" do
        subject { @actual.frequent_renter_points(2) }
        it { expect(subject).to eq(1) }
      end
    end
  end
end
