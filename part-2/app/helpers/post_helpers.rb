module PostHelpers
  def post_heading(post)
    "#{post.guest_name} #{communication_method} ..."
  end

  def post_tagline(post)
  "Written by #{post.guest_name} from #{ensure_hometown(post)} on #{post.created_at.strftime("%B %d, %Y")}."
  end

  def post_likes_count(post)
    if post.likes_count == 1
      "#{post.likes_count} like"
    else
      "#{post.likes_count} likes"
    end
  end

  private
  def communication_method
    %w[wrote said shared].sample
  end

  def ensure_hometown(post)
    post.hometown.empty? ? "parts unknown" : post.hometown
  end
end

helpers PostHelpers
