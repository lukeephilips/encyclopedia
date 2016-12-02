require './lib/word'
require './lib/description'

require 'pry-nav'
require "sinatra"
require "sinatra/reloader"
also_reload('lib/**/*.rb')

get('/') do
  Word.clear
  @lion_desc = Description.new({:definition => 'a dangerous, roaring thing'})
  @lion_desc.save
  @lion = Word.new({:name => 'Lion'})
  @lion.save.add_description(@lion_desc)
  Word.new({:name => 'Moose'}).save
  Word.new({:name => 'Dog'}).save
  Word.new({:name => 'Monkey'}).save
  Word.new({:name => 'Cat'}).save
  @words = Word.all


  @lion
  erb(:words)
end

get ('/words/:id') do
  @word = Word.find(params.fetch('id').to_i)
  # binding.pry
  # @word.add_description()
  erb(:word)
end
