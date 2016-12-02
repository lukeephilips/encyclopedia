require 'word'
require "description"
require 'rspec'
require 'pry-nav'

describe(Word) do
  before do
    Word.clear
    @word0 = Word.new({:name => 'Dog'})
    @word0.save
    @dog = Description.new(:definition => 'a furry, barking thing', :latin => 'doggeus', image:'http://weknowyourdreams.com/images/dog/dog-01.jpg')
    @dog.save
  end
  describe('#initialize') do
    it('displays a word') do
      expect(@word0.name).to eq 'Dog'
    end
  end
  describe('#find') do
    it('displays a word based on its associated id') do
      expect(Word.find(@word0.id)).to eq @word0
    end
    it('displays a word based on its associated id') do
      expect(Word.find(1)).to eq @word0
    end
    it('displays a word based on its associated id') do
      expect(Word.find(@word0.id).name).to eq 'Dog'
    end
  end
  describe('#add_description') do
    it('adds a description object to the word object') do
      expect(@word0.add_description(@dog)).to eq [@dog]
    end
    it('adds a description object to the word object') do
      expect(@word0.add_description(@dog)[0].definition).to eq 'a furry, barking thing'
    end
  end
end
