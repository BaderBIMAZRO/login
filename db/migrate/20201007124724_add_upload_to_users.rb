class AddUploadToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :upload, :string
  end
end
