module GamersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given gamer.
  def gravatar_for(gamer, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(gamer.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: gamer.name, :class => "gravatar")
  end

end
