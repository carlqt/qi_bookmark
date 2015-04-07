class SharedUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  def self.shared_users(user_ids)

  end
end
