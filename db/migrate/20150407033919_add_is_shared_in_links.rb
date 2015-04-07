class AddIsSharedInLinks < ActiveRecord::Migration
  def change
    add_column :links, :is_shared, :boolean, default: false
  end
end
