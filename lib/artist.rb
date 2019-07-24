require('pry')

class Artist
  attr_reader :id
  attr_accessor :name, :stage_id
  @@artists = {}
  @@total_rows = 0

  def initialize(name, stage_id, id)
    @name = name
    @stage_id = stage_id
    @id = id || @@total_rows += 1
  end

  def self.all
    @@artists.values
  end

  def create
    @@artists[self.id] = Artist.new(self.name, self.stage_id, self.id)
  end

  def update(name, stage_id)
    self.name = name
    self.stage_id = stage_id
    @@artists[self.id] = Artist.new(self.name, self.stage_id, self.id)
  end

  def delete
    @@artists.delete(self.id)
  end

  def stage
    Stage.find(self.stage_id)
  end
end
