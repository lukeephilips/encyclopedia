class Word
  attr_reader(:name)
  @@words = []

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @description = []
    @id = @@words.length+1
  end

  def save
    @@words.push(self)
  end
  def id
    @id
  end

  def add_description (description)
    @description.push(description)
  end
  def description
    @description
  end

  def self.all
    @@words.sort! {| a,b | a.name <=> b.name}
  end
  def self.clear
    @@words = []
  end
  def self.find (identifier)
    found_word = nil
    @@words.each do |word|
      if word.id.eql?(identifier.to_i())
        found_word = word
      end
    end
      found_word
  end
end
