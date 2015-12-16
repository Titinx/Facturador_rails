class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.date :birthday
      t.string :gender
      t.string :kind_document
      t.integer :document
      t.string :cuil_cuit

      t.timestamps null: false
    end
  end
end
