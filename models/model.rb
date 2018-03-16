require 'securerandom'

class Model < ActiveRecord::Base
 before_save do |t|
	 cipher = Gibberish::AES.new('p4ssw0rd')
	 encrypted_name = cipher.encrypt(name)
	  t.name = encrypted_name
	  random_string = SecureRandom.hex
	  t.url=random_string
	end

	def decrypted_name
		cipher = Gibberish::AES.new('p4ssw0rd')
		cipher.decrypt(self[:name])
	end


end