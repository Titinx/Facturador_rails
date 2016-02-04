class ChangeKindOfContacts < ActiveRecord::Migration
  def change
  	change_column :contacts, :kind, :integer
  	change_column_default :contacts, :kind, 0
  end
end
