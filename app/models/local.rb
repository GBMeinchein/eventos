class Local < ActiveRecord::Base
  belongs_to :cidade

  geocoded_by :address

  after_validation :geocode

  def address
  	[endereco, cidade.nome, cidade.estado.siglaEstado, "Brasil"].compact.join(', ')
  end

  #belongs_to :evento
end
