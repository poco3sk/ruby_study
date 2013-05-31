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
end
