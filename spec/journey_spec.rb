require 'journey'

describe Journey do

  context 'when initialized' do
    describe '#journeys' do
      it 'has an empty array' do
        expect(subject.journeys.empty?).to eq true
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
end
