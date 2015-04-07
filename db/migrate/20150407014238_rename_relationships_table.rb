class RenameRelationshipsTable < ActiveRecord::Migration
  def change
    rename_table :relationship, :shared_users
  end
end
