class User < ActiveRecord::Base

	def self.create_with_omniauth(auth)
		create! do |user|
			puts "************DEBUG**********************"
			p auth
			puts "************DEBUG**********************"
			user.provider = auth['provider']
			user.uid = auth['uid']
			if auth['info']
				user.name = auth['info']['name'] || ""
			end
		end
	end
end
