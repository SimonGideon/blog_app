module ApplicationHelper
  def updated_at_formatted(time)
    time.strftime('%B %d, %Y at %I:%M %p')
  end
end
