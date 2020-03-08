module AdministratorsHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(administrator)
    gravatar_id  = Digest::MD5::hexdigest(administrator.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: administrator.name, class: "gravatar")
  end
end
