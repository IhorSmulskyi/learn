class Urla < ActiveRecord::Base
		token = Urla.new
		puts token.create4_url4
 		def create4_url4
 		o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
 		string = (0...50).map { o[rand(o.length)] }.join
 		end
 	end