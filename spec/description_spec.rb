require 'description'
require 'rspec'
require 'pry-nav'

describe(Description) do
  before do
    @dog = Description.new(:definition => 'a furry, barking thing')
    @dog.save
  end
  describe('#initialize') do
    it('displays a definition') do
      expect(@dog.definition).to eq 'a furry, barking thing'
    end
  end
end
