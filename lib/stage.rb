require('pry')

class Stage
  attr_reader :id
  attr_accessor :name, :artist
  @@statges = {}
  @@total_rows = 0

  def initialize(name, artist, id)
    @name = name
    @artist = artist
    @id = id || @@total_rows += 1
  end

  def self.all
    @@stages.values()
  end

  def create
    @@stages[self.id] = Stage.new(self.name, self.artist, self.id)
    Stage.sort
  end

  def delete
    @@stages.delete(self.id)
  end

  def update(name, artist)
    self.name = name
    self.artist = artist
    @@stages[self.id] = Stage.new(self.name, self.artist, self.id)
  end

  def artists
    Artist.find_by_artist(self.id)
  end
end
