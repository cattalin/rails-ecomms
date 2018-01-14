class AddImageToOpinion < ActiveRecord::Migration[5.1]
  def up
    add_attachment :opinions, :proof
  end
  
  def down
    remove_attachment :opinions, :proof
  end
end
