class AddThumbnailToProduct < ActiveRecord::Migration[5.1]
  def up
    add_attachment :products, :thumbnail
  end
  
  def down
    remove_attachment :products, :thumbnail
  end
end
