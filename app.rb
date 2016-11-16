require 'json'
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 8080

get '/collaborator/:collaboratorid' do
  content_type :json
  halt 400, { :message => 'the collaborator id needs to be a number' }.to_json unless params['collaboratorid'] =~ /^-?\d+$/ 

  collaboratorid = params['collaboratorid'].to_i

  halt 404, '' unless collaboratorid > 0 && collaboratorid < 6

  team = [{ :id => 1, :name => 'Zeca'},
          { :id => 2, :name => 'Chico'},
          { :id => 3, :name => 'Joca'},
          { :id => 4, :name => 'Gui'},
          { :id => 5, :name => 'Lia'}]

  team.select { |collaborator| collaborator.id != collaboratorid }.to_json
end
