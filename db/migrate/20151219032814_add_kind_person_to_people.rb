class AddKindPersonToPeople < ActiveRecord::Migration
  def change
    add_column :people, :kind_person, :string
  end
end
