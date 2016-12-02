require 'description'
require 'rspec'
require 'pry-nav'

describe(Description) do
  before do
    @dog = Description.new(:definition => 'a furry, barking thing', :latin => 'doggeus', image:'http://weknowyourdreams.com/images/dog/dog-01.jpg')
    @dog.save
  end
  describe('#initialize') do
    it('displays a definition') do
      expect(@dog.definition).to eq 'a furry, barking thing'
    end
    it('displays latin') do
      expect(@dog.latin).to eq 'doggeus'
    end
  end
end
