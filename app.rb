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
	@model = Model.new(params[:model],permit([:url, @token]))
	# @model = Model.new(params[:model].permit[:url])
	if @model.save
		redirect '/models'
	else
		"Sorry, there was an error!"
	end
end


# get '/url'
#     @models = Group.find(params[:url])
# end


get '/models' do
	@models = Model.all
	erb :models
end
