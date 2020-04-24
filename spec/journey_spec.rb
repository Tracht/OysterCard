require 'journey'
require 'card'

shared_context "topped up & tapped_in" do
  let(:subject) do
    entry_station = double()
    min_balance = Card::MIN_BALANCE
    subject = Card.new
    subject.top_up(min_balance)
    subject.tap_in(entry_station)
    subject
  end
end

describe Journey do

  context 'when initialized' do
    describe '#journeys' do
      it 'has an empty array' do
        expect(subject.journeys.empty?).to eq true
      end
    end

    describe '#journey_completed?' do
      it 'raises error if there are no journeys' do
        expect { subject.journey_completed? }.to raise_error "There are no journeys"
      end
    end
  end

  context 'when tapped_in & topped_up' do
    include_context "topped up & tapped_in"

    describe '#journey_completed?' do
      it 'returns true if journey is completed' do
        exit_station = double()
        card = Card.new
        card.tap_out(exit_station)
        expect( subject.journey_completed? ).to eq true
      end
      it 'returns false if journey is not complete' do
        expect( subject.journey_completed? ).to eq false
      end
    end
  end

end


# context 'when tapped_in' do
#   describe "#start_journey" do
#     it 'takes ' do
#       expect(subject.start_journey())
#     end
#   end
# end
