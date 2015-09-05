class Local < ActiveRecord::Base
  belongs_to :cidade

  geocoded_by :endereco
  after_validation :geocode
  #belongs_to :evento
end
