require "rails_helper"

RSpec.describe User do 
  before :each do 
   @data = {
      "data": {
          "id": "1234567890a",
          "type": "user",
          "attributes": {
              "email": "bh@gmail.com",
              "name": "Brian",
              "google_id": "1234567890a",
              "id": "1234567890a",
              "intolerances": "gluten",
              "likes": "pizza",
              "dislikes": "beans",
              "dietary_restrictions": "dairy"
          }
      }
    }

    @google_data = { "provider": "google_oauth2",
      "uid": "1234567890a",
      "info": 
      { "name": "Brian",
        "email": "bh@gmail.com",
        "unverified_email": "bh@gmail.com",
        "email_verified": true,
        "first_name": "Brian",
        "last_name": "Hayes",
        "image": "https://lh3.googleusercontent.com/a/AGNmyxZ25FObF_GqP2aDMsNQOyVA5cWWKHoCtMNRJMQarA=s96-c"
      }
    }
    @user = User.new(@data)
  end 

  it "will exist and have attributes" do 
      expect(@user.name).to eq("Brian")
      expect(@user.email).to eq("bh@gmail.com")
      expect(@user.google_id).to eq("1234567890a")
      expect(@user.intolerances).to eq("gluten")
      expect(@user.likes).to eq("pizza")
      expect(@user.dislikes).to eq("beans")
      expect(@user.dietary_restrictions).to eq("dairy")
  end

  it "will have raw data method" do 
    expect(User.raw_google_data(@google_data)[:google_id]).to eq("1234567890a")
    expect(User.raw_google_data(@google_data)[:name]).to eq("Brian")
    expect(User.raw_google_data(@google_data)[:email]).to eq("bh@gmail.com")
  end
end