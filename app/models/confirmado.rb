class Confirmado < ActiveRecord::Base
	belongs_to :login
	belongs_to :evento
end
