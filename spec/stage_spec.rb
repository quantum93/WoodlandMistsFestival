require 'rspec'
require 'stage'

describe '#Stage' do

  before(:each) do
    Stage.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no stages") do
      expect(Stage.all).to(eq([]))
    end
  end

  describe('#==') do # This check whether the duplicated stage assignment for same artist or not.
    it("is the same stage if it has the same attributes as another stage") do
      stage = Stage.new("Epic Hall one", "Ben", nil)
      stage2 = Stage.new("Epic Hall one", "Ben", nil)
      expect(stage).to(eq(stage2))
    end
  end

  describe('.clear') do
      it("clears all stages") do
        stage = Stage.new("Epic Hall one", "Ben", nil)
        stage2 = Stage.new("Epic Hall two","Ben", nil)
        stage2.create()
        Stage.clear()
        expect(Stage.all).to(eq([]))
      end
    end

    describe('.find') do
      it("finds an stage by id") do
        stage = Stage.new("Epic Hall one", "Ben", nil)
        stage.create()
        stage2 = Stage.new("Epic Hall two", "Ben", nil)
        stage2.create()
        expect(Stage.find(stage.id)).to(eq(stage))
      end
    end

    describe('#update') do
      it("updates an stage by id") do
        stage = Stage.new("Epic Hall one", "Ben", nil)
        stage.create()
        stage.update("Epic Hall two", "Ben" )
        expect(stage.name).to(eq("Epic Hall two"))
      end
    end

    describe('#delete') do
      it("deletes an stage by id") do
        stage = Stage.new("Epic Hall one", "Ben", nil)
        stage.create()
        stage2 = Stage.new("Epic Hall two", "Ben", nil)
        stage2.create()
        stage.delete()
        expect(Stage.all).to(eq([stage2]))
      end
    end

    describe('#create') do
      it("creates a stage") do
        stage = Stage.new("Epic Hall one", "Ben", nil)
        stage.create()
        stage2 = Stage.new("Epic Hall two", "Ben", nil)
        stage2.create()
        expect(Stage.all).to(eq([stage, stage2]))
      end
    end
    
end
