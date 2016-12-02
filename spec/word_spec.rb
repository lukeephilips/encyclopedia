require 'word'
require 'rspec'
require 'pry-nav'

describe(Word) do
  before do
    @word0 = Word.new({:name => 'dog'})
    @word0.save
  end
  it('displays a word') do
    expect(@word0.name).to eq 'dog'
  end
end
