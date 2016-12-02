require './lib/word'
require './lib/description'

require 'pry-nav'
require "sinatra"
require "sinatra/reloader"
also_reload('lib/**/*.rb')
# Initial encyclopedia items
lion = Word.new({:name => 'Lion'})
lion.save
lion_desc = Description.new({:definition => 'a dangerous, roaring thing'})
lion_desc.save
lion.add_description(lion_desc)

moose = Word.new({:name => 'Moose'})
moose.save
moose_desc = Description.new({:definition => 'a large thing with antlers'})
moose_desc.save
moose.add_description(moose_desc)

dog = Word.new({:name => 'Dog'})
dog.save
dog_desc = Description.new({:definition => 'a furry, barking thing'})
dog_desc.save
dog.add_description(dog_desc)

monkey = Word.new({:name => 'Monkey'})
monkey.save
monkey_desc = Description.new({:definition => 'a clever, climbing thing'})
monkey_desc.save
monkey.add_description(monkey_desc)

cat = Word.new({:name => 'Cat'})
cat.save
cat_desc = Description.new({:definition => 'a sneaky, vile thing'})
cat_desc.save
cat.add_description(cat_desc)

get('/') do
  @words = Word.all()
  erb(:words)
end

get ('/words/:id') do
  @word = Word.find(params.fetch('id').to_i)

  erb(:word)
end
post ('/words/:id') do
  @word = Word.find(params.fetch('id').to_i)

  erb(:word)
end

get ('/add') do

  erb(:word_form)
end

post ('/add') do
  new_word = Word.new({:name => params.fetch('name')})
  new_word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id/definition/new') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:description_form)
end

post('/words/:id/definition/new') do
  @word = Word.find(params.fetch('id').to_i)
  @words = Word.all
  new_description = Description.new({:definition => params.fetch('definition')})
  new_description.save
  @word.add_description(new_description)
  @description = Description.all
  erb(:word)
end
