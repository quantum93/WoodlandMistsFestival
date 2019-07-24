require 'rspec'
require 'artist'
require 'stage'
require 'pry'

describe "#Artist" do

  before(:each) do
    Stage.clear()
    Artist.clear()
    @stage = Stage.new("Epic Hall one", "Ben", nil)
    @stage.create()
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new("Naima", @stage.id, nil)
      artist2 = Artist.new("Naima", @stage.id, nil)
      expect(artist).to(eq(artist2))
    end
  end

  describe('.all') do
    it("returns a list of all artists") do
      artist = Artist.new("Ben", @stage.id, nil)
      artist.create()
      artist2 = Artist.new("Jacob", @stage.id, nil)
      artist2.create()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('#create') do
    it("creates an artist") do
      artist = Artist.new("Naima", @stage.id, nil)
      artist.create()
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe('.find') do
    it("finds an artist by id") do
      artist = Artist.new("Giant Steps", @stage.id, nil)
      artist.create()
      artist2 = Artist.new("Naima", @stage.id, nil)
      artist2.create()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist = Artist.new("Naima", @stage.id, nil)
      artist.create()
      artist.update("Mr. P.C.", @stage.id)
      expect(artist.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      artist = Artist.new("Giant Steps", @stage.id, nil)
      artist.create()
      artist2 = Artist.new("Naima", @stage.id, nil)
      artist2.create()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

end
