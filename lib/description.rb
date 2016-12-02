class Description
  attr_reader(:definition)
  @@descriptions = []

  def initialize (attributes)
    @definition = attributes.fetch(:definition)
  end
  def save
    @@descriptions.push(self)
  end
  def self.all
    @@descriptions
  end
  def self.clear
    @@descriptions = []
  end
end
