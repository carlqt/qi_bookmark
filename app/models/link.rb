class Link < ActiveRecord::Base
  belongs_to :user
  has_many :shared_users
  has_many :user_shares, through: :shared_users, source: :user

  accepts_nested_attributes_for :shared_users

  def self.viewable(user)
    links = Link.includes(:user).order(created_at: :desc).select do |link|
      !link.is_shared? || link.user_shares.include?(user) || link.user_id == user.id
    end
  end

end
