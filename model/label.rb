class Label
  attr_reader :id, :title, :color
  attr_accessor :items

  def initialize(id, title, color)
    @id = id || Random.rand(1..500)
    @title = title
    @color = color
    @items = []
  end

  def add_label(item)
    @items << item
    item.add_label(self)
  end
end
