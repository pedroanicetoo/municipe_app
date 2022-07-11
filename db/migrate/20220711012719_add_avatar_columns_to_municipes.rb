class AddAvatarColumnsToMunicipes < ActiveRecord::Migration[6.1]
  def up
    add_column :municipes, :avatar_file_name, :string
    add_column :municipes, :avatar_file_size, :integer
    add_column :municipes, :avatar_content_type, :string
    add_column :municipes, :avatar_updated_at, :datetime
 end

 def down
    remove_column :municipes, :avatar_file_name, :string
    remove_column :municipes, :avatar_file_size, :integer
    remove_column :municipes, :avatar_content_type, :string
    remove_column :municipes, :avatar_updated_at, :datetime
 end
end
