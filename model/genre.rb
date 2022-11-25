class Genre
  attr_accessor :name, :id
  attr_reader :items

  def initialize(id, name)
    @name = name
    @id = id || Random.rand(1..500)
    @items = []
  end

  def add_genre(item)
    @items << item
    item.add_genre(self)
  end
end
