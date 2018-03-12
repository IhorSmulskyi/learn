class Model < ActiveRecord::Base
 before_save do |t|
		t.cipher = Gibberish::AES.new('p4ssw0rd')
		puts cipher.encrypt("some secret text")
	end
end