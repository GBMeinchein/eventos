class Evento < ActiveRecord::Base
	belongs_to :local
	belongs_to :login
	has_many :confirmado
	#has_many :login, through: :confirmado, source: :login
	mount_uploader :imagem, PictureUploader
	validates_presence_of :titulo, message: "deve ser preenchido"
	validates_presence_of :inicio, message: "deve ser preenchido"

	def self.search(tituloQuery, estadoQuery, cidadeQuery, localQuery, deQuery, ateQuery)
    	#where("titulo like ? +  and local_id = ?",  "%#{query}%", "#{querylocal}")
    	#where("#{'local_id = ' + (localQuery if localQuery.present?) + 'and titulo like ' + (tituloQuery if tituloQuery.present?)}")
    	#where("#{'titulo = ' + tituloQuery if tituloQuery.present?}")

    	dataDe = deQuery['year'] + "-" + deQuery['month'] + "-" + deQuery['day'] if deQuery.present?
    	dataAte = ateQuery['year'] + "-" + ateQuery['month'] + "-" + ateQuery['day'] if ateQuery.present?

		joins("#{'inner join locals on locals.id = eventos.local_id inner join cidades on locals.cidade_id = cidades.id' if cidadeQuery.present? || estadoQuery.present?}")
		.where("#{'cidades.id = ' + cidadeQuery if cidadeQuery.present?}")
		.where("#{'cidades.estado_id = ' + estadoQuery if estadoQuery.present?}")
		.where("#{('eventos.local_id = ' + localQuery if localQuery.present?)}")
		.where("#{'eventos.titulo like ' + "'%" + tituloQuery + "%'" if tituloQuery.present?}")
		.where("#{'eventos.inicio >= ' + "'" + dataDe + "'" if deQuery.present?}")					
		.where("#{'eventos.inicio <= ' + "'" + dataAte + "'" if ateQuery.present?}")	
		.order("numeroConfirmados DESC")


		#where("#{('eventos.local_id = ' + localQuery if localQuery.present? + 'and ventos.titulo = ' + "'" + tituloQuery + "'")}")
		#where("#{'eventos.titulo = ' + "'" + tituloQuery + "'" if tituloQuery.present?}")#.where(locals_id: localQuery) 
		#joins("#{'LEFT OUTER JOIN locals ON eventos.locals_id = locals.id'}").where("#{'eventos.locals_id = ' + localQuery if localQuery.present?}")#.where(locals_id: localQuery) 
		#joins("inner JOIN locals ON locals_id = locals.id").where(local_id: localQuery)
		#where(locals: localQuery) 
		# where("#{'locals.id = ' + localQuery if localQuery.present?}") 
		#	Evento.joins(local: [cidade: :estado])
		#	if(query != "")
		#		joins(local: [cidade: :estado]).where(titulo: query)
		#	end
		#	if(estadoQuery != "")
		#		joins(local: [cidade: :estado]).where(estados: {id: estadoQuery})
		#	end
		#	if(cidadeQuery != "")
		#		where(cidades: {id: cidadeQuery})				
		#	end
		#	if(localQuery != "")
		#		where(locals: {id: localQuery})
		#	end*/
		#			where(titulo: query, estados: {id: estadoQuery}, cidades: {id: cidadeQuery}, locals: {id: localQuery})    		
    	#end
  	end
end
