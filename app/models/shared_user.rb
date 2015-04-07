class SharedUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  def self.shared_users(user_ids, link)
    user_ids.each { |id| SharedUser.create(link_id: link.id, user_id: id) }
  end
end
