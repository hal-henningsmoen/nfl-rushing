require "rails_helper"

RSpec.describe PlayersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/players").to route_to("players#index")
    end
  end
end
