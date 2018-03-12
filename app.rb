require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/model'        #Model class
require 'gibberish'

# before '/submit'do

# cipher = Gibberish::AES.new('p4ssw0rd')
# puts cipher.encrypt("some secret text")

# 	class Urla < ActiveRecord::Base
# 		token = Urla.new
# 		puts token.create4_url4
# 		def create4_url4
# 		o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
# 		string = (0...50).map { o[rand(o.length)] }.join
# 		end
# 	end
# end


get '/' do
	erb :index
end

get '/1' do
"You on 1 page"
end

post '/submit' do
	@model = Model.new(params[:model].permit[:url])
	if @model.save
		redirect '/models'
	else
		"Sorry, there was an error!"
	end
end


get '/url'
    @models = Group.find(params[:url])
  end


get '/models' do
	@models = Model.all
	erb :models
end
