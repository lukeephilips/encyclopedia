require 'word'
require 'description'
require 'rspec'
require 'pry-nav'

describe(Word) do
  before do
    Word.clear
    @word0 = Word.new({:name => 'dog'})
    @word0.save
  end
  describe('#initialize') do
    it('displays a word') do
      expect(@word0.name).to eq 'dog'
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
      expect(Word.find(@word0.id).name).to eq 'dog'
    end
  end
end
