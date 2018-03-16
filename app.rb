require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/model'        #Model class

require 'gibberish'


get '/' do
	erb :index
end

get '/1' do
"You on 1 page"
end

post '/submit' do
	@model = Model.new(params[:model])
	if @model.save
		redirect '/models'
	else
		"Sorry, there was an error!"
	end
end

get '/models' do
	@models = Model.all
	erb :models
end

get '/models/:slug' do
	@model = Model.find_by_url(params[:slug])
	@message = @model.decrypted_name
	erb :show 
	Model.destroy(@model.id)
end

get '/:url' do
	@models = Model.find(params[:id])
	erb :url


end

