class Evento < ActiveRecord::Base
	belongs_to :local
	mount_uploader :imagem, PictureUploader
	validates_presence_of :titulo, message: "deve ser preenchido"
	validates_presence_of :inicio, message: "deve ser preenchido"

	def self.search(query, querylocal)
    	#where("titulo like ? and local_id = ?",  "%#{query}%", "#{querylocal}")
    	where("titulo like ?", "%#{query}%")
  	end
end
