class AddAdressToMunicipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :municipes, :address, null: false, foreign_key: true
  end
end
