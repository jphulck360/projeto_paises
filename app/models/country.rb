class Country < ApplicationRecord
	has_attached_file :imagem

	validates_attachment_content_type :imagem, 
	:less_than_or_equal_to => 10.megabytes,
	:content_type => ["image/png", "image/jpeg", "image/jpg", "image/gif", "image/mp4"],
	# add => avi, mpeg, e mp4
	:message => "Arquivos com no máximo 5MB"
end
