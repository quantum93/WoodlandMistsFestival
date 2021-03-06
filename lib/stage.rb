require('pry')

class Stage
  attr_reader :id
  attr_accessor :name, :artist
  @@stages = {}
  @@total_rows = 0

  def initialize(name, artist, id)
    @name = name
    @artist = artist
    @id = id || @@total_rows += 1
  end

  def self.all
    @@stages.values()
  end

  def self.clear # it works with spec files before(:each) routine.
    @@stages = {}
    @@total_rows = 0
  end

  def self.find(id) # it works with 5th spec test of festival_spec files
    @@stages[id]
  end

  def == (stage_to_compare) # it works with second test of festival_spec files
    self.name() == stage_to_compare.name()
    self.artist() == stage_to_compare.artist()
  end

  def create
    duplicated = ""
    artist = self.artist
    @@stages.values.each do |stage|
      if artist == stage.artist
        duplicated = "this artist is already assigned to a stage."
      end
    end
    if duplicated == ""
      # binding.pry
      @@stages[self.id] = Stage.new(self.name, self.artist, self.id)
    end
    duplicated
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
    Artist.find_by_stage(self.id)
  end

  # def self.duplicated
  #   array = @@albums.sort_by {|key, val| val.name}
  #   @@albums = Hash[array.map { |key, val | [key,val]}]
  # end

end
