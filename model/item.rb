require 'date'
class Item
  def initialize(publish_date, archived)
    @id = Random.rand(1..500)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    item.genre << genre
  end

  def author=(author)
    @author = author
    item.author << author
  end

  def label=(label)
    @label = label
    item.label << label
  end

  def can_be_archived?()
    current_year = Date.today.year
    publish_year = Date.parse(@publish_date).year
    current_year - publish_year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
