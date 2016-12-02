class Description
  attr_reader(:definition, :latin)
  @@descriptions = []

  def initialize (attributes)
    @definition = attributes.fetch(:definition)
    @latin = attributes.fetch(:latin)

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
