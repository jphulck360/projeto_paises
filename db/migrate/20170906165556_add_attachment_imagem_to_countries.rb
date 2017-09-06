class AddAttachmentImagemToCountries < ActiveRecord::Migration
  def self.up
    change_table :countries do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :countries, :imagem
  end
end
