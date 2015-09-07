class Evento < ActiveRecord::Base
	belongs_to :local
	mount_uploader :imagem, PictureUploader
	validates_presence_of :titulo, message: "deve ser preenchido"
	validates_presence_of :inicio, message: "deve ser preenchido"

	def self.search(query, estadoQuery, cidadeQuery, localQuery)
    	#where("titulo like ? and local_id = ?",  "%#{query}%", "#{querylocal}")
    	joins(local: [cidade: :estado] ).where(estados: {id: estadoQuery})# {cidades: {id :cidadeQuery}})
    	#where("titulo like ? and local.cidade.estado.id = ?", "%#{query}%", "#{estadoQuery}")
  	end
end
