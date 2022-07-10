class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :fullname
      t.string :cpf
      t.string :cns
      t.string :email
      t.date :birthdate
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
