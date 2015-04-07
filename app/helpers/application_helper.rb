module ApplicationHelper
  def flash_messages(flash)
    key = flash.keys.first
    Array.wrap flash[key]
  end
end
