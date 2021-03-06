class Link < ActiveRecord::Base
  belongs_to :user
  has_many :relationships
  has_many :shared_to_users, through: :relationships, source: :user

  accepts_nested_attributes_for :relationships

  validates_format_of :name, with: URI.regexp, message: "didn't contain or is not a link. Add http:// or https:// to your link"

  def self.viewable(user, viewing_user = nil)
    links = Link.includes(:user).order(created_at: :desc).select do |link|
      !link.is_shared? || link.shared_to_users.include?(viewing_user || user) || link.user_id == user.id
    end
  end

end
