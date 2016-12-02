class Word
  attr_reader(:name)
  @@words = []
  def initialize (attributes)
    @name = attributes.fetch(:name)
  end
  def self.all
    @@words
  end
  def save
    @@words.push(self)
  end
  def self.clear
    @@words = []
  end
end
