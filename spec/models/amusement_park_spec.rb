require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:ride_mechanics).through(:rides) }
  end

  describe "class methods" do
    before :each do
      @park1 = AmusementPark.create!(name: "Two Flags", admission_cost: 25)
      @park2 = AmusementPark.create!(name: "Dizzy World", admission_cost: 1000)

      @ride1 = @park1.rides.create!(name: "Vomit Machine", thrill_rating: 100, open: true)
      @ride2 = @park1.rides.create!(name: "Killer Coaster", thrill_rating: 75, open: true)
      @ride3 = @park1.rides.create!(name: "Puke Cruise", thrill_rating: 50, open: false)
      @ride4 = @park1.rides.create!(name: "Slow Ride", thrill_rating: 10, open: true)
      @ride5 = @park1.rides.create!(name: "Lazy River", thrill_rating: 1, open: true)
      @ride6 = @park1.rides.create!(name: "Hurl Twirler", thrill_rating: 99, open: false)
      @ride7 = @park2.rides.create!(name: "Side Winder", thrill_rating: 1000, open: true)
      
      @mechanic1 = Mechanic.create!(name: "Billy Bob", years_experience: 35)
      @mechanic2 = Mechanic.create!(name: "Silly Bob", years_experience: 1)
      @mechanic3 = Mechanic.create!(name: "Mr T", years_experience: 87)

      @ride_mechanic1 = RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
      @ride_mechanic2 = RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mechanic1.id)
      @ride_mechanic3 = RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)
      @ride_mechanic4 = RideMechanic.create!(ride_id: @ride4.id, mechanic_id: @mechanic2.id)
      @ride_mechanic5 = RideMechanic.create!(ride_id: @ride5.id, mechanic_id: @mechanic2.id)
      @ride_mechanic6 = RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic2.id)
      @ride_mechanic7 = RideMechanic.create!(ride_id: @ride7.id, mechanic_id: @mechanic3.id)
    end
    
    it "park_mechanics methods" do 
      expect(@park1.park_mechanics).to eq([@mechanic1.name, @mechanic2.name])
    end
  end
end