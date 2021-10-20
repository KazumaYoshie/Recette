class RenameProfileImageUrlColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :profile_image_url, :profile_image_id
  end
end
