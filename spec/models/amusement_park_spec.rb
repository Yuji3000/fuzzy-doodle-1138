require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    
    @coaster = Ride.create!(name: "big roller coaster", thrill_rating: 3, open: true, amusement_park_id: @six_flags.id)
    @john = Mechanic.create!(name: "John", years_experience: 12)
    @john_ride = MechanicRide.create!(mechanic_id: @john.id, ride_id: @ferris.id )
    @john_ride = MechanicRide.create!(mechanic_id: @john.id, ride_id: @hurler.id )
    @bill = Mechanic.create!(name: "Bill", years_experience: 10)
    @bill_ride = MechanicRide.create!(mechanic_id: @bill.id, ride_id: @scrambler.id )
    @bobby = Mechanic.create!(name: "Bobby", years_experience: 19)
    @bobby_ride = MechanicRide.create!(mechanic_id: @bobby.id, ride_id: @jaws.id )
  end
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides)}
  end

  describe '#mechanics_count' do
    it "should return a count of distinct mechanics" do
      
      expect(@six_flags.mechanics_names).to eq([@john, @bill])
    end
  end
end