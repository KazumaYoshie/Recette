class ChangeDataProfileImageUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :profile_image_url, :string
  end
end
