class Journey
  attr_accessor :journeys

  def initialize
    @journeys = []
  end

# {:entry => "bank", :exit => nil}

  def journey_completed?
    raise "There are no journeys" if @journeys.empty?
    key = @journeys.last
    key[:entry] == nil && key[:exit] == nil
  end

end





# Brainstorming pathway
# card = Card.new
# @journey = Journey.new
#
# Journey class
# @journeys = []
# card.tap_in(station)
