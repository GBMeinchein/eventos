class Evento < ActiveRecord::Base
	belongs_to :local
	mount_uploader :imagem, PictureUploader
	validates_presence_of :titulo, message: "deve ser preenchido"
	validates_presence_of :inicio, message: "deve ser preenchido"

	def self.search(query, estadoQuery, cidadeQuery, localQuery)
    	#where("titulo like ? and local_id = ?",  "%#{query}%", "#{querylocal}")
    	#if(query == "" && estadoQuery == "" && cidadeQuery == "" && localQuery == "")
		#	Evento.all
		#else
		joins(local: [cidade: :estado]).where(titulo: query, estados: {id: estadoQuery}, cidades: {id: cidadeQuery}, locals: {id: localQuery})    		
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
