class Evento < ActiveRecord::Base
	mount_uploader :imagem, PictureUploader
end
