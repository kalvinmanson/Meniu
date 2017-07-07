class AddAttachmentPictureToPlaces < ActiveRecord::Migration[5.1]
  def self.up
    change_table :places do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :places, :picture
  end
end
