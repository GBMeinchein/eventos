class Evento < ActiveRecord::Base
	belongs_to :local
	mount_uploader :imagem, PictureUploader
end
