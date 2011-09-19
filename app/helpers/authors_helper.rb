module AuthorsHelper
  def avatar_url(user,size = 40)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&r=PG"
  end
end