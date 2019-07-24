require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('pry')
require('./lib/artist')
also_reload('lib/**/*.rb')

get ('/') do
  @stages = Stage.all
  erb(:stages)
end

get ('/stages') do
  @stages = Stage.all
  erb(:stages)
end

get ('/stages/new') do
  erb(:new_stage)
end

post ('/stages') do
  name = params[:stage_name]
  artist = params[:stage_artist]
  stage = Stage.new(name, artist, nil)
  stage.save()
  @stages = Stage.all()
  erb(:stages)
end

get ('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  erb(:stage)
end

post ('/stages_search') do
  name = params[:search]
  @stages = Stage.search(name)
  erb(:stage_results)
end

get ('/stages/:id/edit') do
  @stage = Stage.find(params[:id].to_i())
  erb(:edit_stage)
end

patch ('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @stage.update(params[:name, :artist])
  @stages = Stage.all
  erb(:stages)
end

delete ('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @stage.delete()
  @stages = Stage.all
  erb(:stages)
end
