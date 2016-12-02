require './lib/word'
require './lib/description'

require 'pry-nav'
require "sinatra"
require "sinatra/reloader"
also_reload('lib/**/*.rb')
# Initial encyclopedia items
lion = Word.new({:name => 'Lion'})
lion.save
lion_desc = Description.new({:definition => 'a dangerous, roaring thing', :latin => 'Panthera leo', :image => 'https://upload.wikimedia.org/wikipedia/commons/7/73/Lion_waiting_in_Namibia.jpg'})
lion_desc.save
lion.add_description(lion_desc)

moose = Word.new({:name => 'Moose'})
moose.save
moose_desc = Description.new({:definition => 'a large thing with antlers', :latin => 'Alces alces', :image => 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Moose_superior.jpg/1024px-Moose_superior.jpg'})
moose_desc.save
moose.add_description(moose_desc)

dog = Word.new({:name => 'Dog'})
dog.save
dog_desc = Description.new({:definition => 'a furry, barking thing', :latin => 'Canis familiaris', :image => 'http://weknowyourdreams.com/images/dog/dog-01.jpg'})
dog_desc.save
dog.add_description(dog_desc)

monkey = Word.new({:name => 'Chimpanzee'})
monkey.save
monkey_desc = Description.new({:definition => 'a clever, climbing thing', :latin => '
Pan troglodytes', :image => 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Schimpanse_Zoo_Leipzig.jpg/1280px-Schimpanse_Zoo_Leipzig.jpg'})
monkey_desc.save
monkey.add_description(monkey_desc)

cat = Word.new({:name => 'Cat'})
cat.save
cat_desc = Description.new({:definition => 'a sneaky, vile thing', :latin => 'Felis catus', :image => 'https://www.petfinder.com/wp-content/uploads/2012/11/140272627-grooming-needs-senior-cat-632x475.jpg'})
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
  new_description = Description.new({:definition => params.fetch('definition'), :latin => params.fetch('latin'), :image => params.fetch('image')})
  new_description.save
  @word.add_description(new_description)
  @description = Description.all
  erb(:word)
end

get ('/find') do
  erb(:find_word)
end
post ('/find') do
  @find_word = params.fetch('find')
    id = Word.find_id(@find_word)
    if !id
      erb(:no_match)
    else
    @word = Word.find(id)
    erb(:word)
  end
end
