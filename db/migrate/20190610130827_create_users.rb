class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.string :address
      t.string :image
      t.string :mobile
      t.boolean :admin

      t.timestamps
    end
  end
end
