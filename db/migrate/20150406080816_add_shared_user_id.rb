class AddSharedUserId < ActiveRecord::Migration
  def change
    rename_column :relationships, :friend_id, :shared_user_id
  end
end
