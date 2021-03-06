class Card
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :entry_station, :journeys

  def initialize(balance=0)
    @balance = balance
    # @journeys = []
    @journeys = Journey.new
  end

  def top_up(amount)
    fail "Cannot top-up with negative amount" if amount < 0
    fail "Top-up exceeds balance limit" if @balance + amount > MAX_BALANCE
      @balance += amount
  end

  def tap_in(entry_station)
    fail "Insufficient funds: min. £#{MIN_BALANCE} required" if @balance < MIN_BALANCE
    station_hash = {:entry_station => entry_station, :exit_station => nil}
    @journeys.journeys.push(station_hash)
  end

  def tap_out(exit_station)
    deduct_fare
    @journeys.journeys.last[:exit_station] = exit_station
  end

  def in_journey?
    return false if @journeys.journeys.empty?
    return true if @journeys.journeys.last[:exit_station] == nil
    false
  end

  private
  def deduct_fare
    @balance -= MIN_BALANCE
  end

end
