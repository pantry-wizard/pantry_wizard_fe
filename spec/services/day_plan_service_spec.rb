require "rails_helper"

RSpec.describe DayPlanService do 
  context "get requests" do
    it "can get a user's day plans by their google id" do 
      VCR.use_cassette('user_day_plans') do
        user_id = '1'
        day_plans = DayPlanService.user_day_plans(user_id)
        data = day_plans[:data]
        
        expect(data.count).to eq(3)
        expect(data).to be_an Array
  
        day_plan = data.first
  
        expect(day_plan[:id]).to eq("1")
        expect(day_plan[:attributes][:user_id]).to eq(1)
        expect(day_plan[:attributes][:date]).to eq("2021-01-01")
      end
    end

    it "can get a user's specific day plan" do
      VCR.use_cassette('user_day_plan') do
        user_id = '1'
        day_plan_id = '1'
        day_plan = DayPlanService.user_day_plan(user_id, day_plan_id)

        data = day_plan[:data]
        expect(data[:id]).to eq("1")
        expect(data[:attributes][:user_id]).to eq(1)
        expect(data[:attributes][:date]).to eq("2021-01-01")
      end
    end
  end

  context "post requests" do
    it "can create a day plan" do
      VCR.use_cassette('create_user_day_plan') do
        user_id = '1'
        day_plan = {
          user_id: "1",
          date: "2022-06-21"
        }
        new_day_plan = DayPlanService.create_user_day_plan(user_id, day_plan)
        data = new_day_plan[:data]

        expect(data[:id]).to eq("5")
        expect(data[:attributes][:user_id]).to eq(1)
        expect(data[:attributes][:date]).to eq("2022-06-21")
      end

      VCR.use_cassette('user_day_plans_after_creation') do
        user_id = '1'
        day_plans = DayPlanService.user_day_plans(user_id)
        data = day_plans[:data]

        new_day_plan = data.last
        expect(new_day_plan[:id]).to eq("5")
        expect(new_day_plan[:attributes][:user_id]).to eq(1)
        expect(new_day_plan[:attributes][:date]).to eq("2022-06-21")
      end
    end
  end
  
  context "patch requests" do
    it "can update a day plan" do
      VCR.use_cassette('update_user_day_plan') do
        user_id = '1'
        day_plan_id = "5"
        day_plan_changes = {
          date: "2022-07-21"
        }
        updated_day_plan = DayPlanService.update_user_day_plan(user_id, day_plan_id, day_plan_changes)
        data = updated_day_plan[:data]

        expect(data[:id]).to eq("5")
        expect(data[:attributes][:user_id]).to eq(1)
        expect(data[:attributes][:date]).to eq("2022-07-21")
      end
    end
  end
  context "delete requests" do
    it "can delete a day plan" do
      VCR.use_cassette('delete_user_day_plan') do
        user_id = '1'
        day_plan_id = "5"
        new_day_plan = DayPlanService.delete_user_day_plan(user_id, day_plan_id)
        data = new_day_plan[:data]
        expect(data[:id]).to eq("5")
        expect(data[:attributes][:user_id]).to eq(1)
        expect(data[:attributes][:date]).to eq("2022-07-21")
      end

      VCR.use_cassette('user_day_plans_after_deletion') do
        user_id = '1'
        day_plans = DayPlanService.user_day_plans(user_id)
        data = day_plans[:data]

        day_plan = data.last
        expect(day_plan[:id]).to_not eq("5")
        expect(day_plan[:attributes][:date]).to_not eq("2022-07-21")
      end
    end
  end
end