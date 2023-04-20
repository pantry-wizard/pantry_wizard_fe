class LocalRecipeService

  def self.user_recipes(user_id)
    response = conn.get("/api/v1/users/#{user_id}/recipes")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_recipe(recipe)
    response = conn.post("/api/v1/recipes", recipe)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.delete_user_recipe(recipe_id)
    response = conn.delete("/api/v1/recipes/#{recipe_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private 
  
  def self.conn 
    Faraday.new(url: ENV["HOST_URL"])
  end

end