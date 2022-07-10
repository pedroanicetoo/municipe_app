class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zipcode
      t.string :publicplace
      t.string :complement
      t.string :district
      t.string :city
      t.string :uf
      t.integer :ibgecode

      t.timestamps
    end
  end
end
