class Confirmado < ActiveRecord::Base
	belongs_to :login
	belongs_to :evento

	def self.search(eventoQuery, loginQuery)
		
		where("evento_id = ? and login_id = ?",  "#{eventoQuery}", "#{loginQuery}")
		
	end

end
