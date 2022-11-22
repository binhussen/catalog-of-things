class Genre
  def initialize(id, name, _items)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @item = item
  end
end
