class Word
  attr_reader(:name)
  @@words = []

  def initialize (attributes)
    @name = attributes.fetch(:name)
  end
  def save
    @@words.push(self)
  end
  def self.all
    @@words.sort! {| a,b | a.name <=> b.name}
  end
  def self.clear
    @@words = []
  end
end
