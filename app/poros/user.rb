class User 
  attr_reader :id,
              :uid,
              :username, 
              :email, 
              :intolerances, 
              :likes, 
              :dietary_restrictions

  def initialize(response)
    @id = response[:id]
    @uid = response[:uid]
    @username = response[:username]
    @email = response[:email]
    @intolerances = response[:intolerances]
    @likes = response[:likes]
    @dietary_restrictions = response[:dietary_restrictions]
  end
end