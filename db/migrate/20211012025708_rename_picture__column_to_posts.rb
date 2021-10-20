class RenamePictureColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :picture_, :picture_id
  end
end
