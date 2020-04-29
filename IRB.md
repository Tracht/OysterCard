# IRB

# User experience in IRB

## Scenario 1: User does everything 'right'
card = Card.new
card.balance
=> should return 0
card.top_up(10)
=> balance should return 10
card.tap_in(Bank)
card.balance
=>should show min fare deducted from balance
card.tap_out(Holborn)
card.balance
=> should show correct new balance

## Scenario 2: Insufficient balance: User doesn't top_up, can't tap in
card = Card.new
card.tap_in(Bank)
=> should raise error relating to balance

## Scenario 3: Penalty fare: User forgets to tap-out
card = Card.new
card.top_up(10)
card.tap_in(Bank)
card.balance
=> should show min fare deducted from balance
card.tap_in(Embankment)
card.balance
=> balance reduced by penalty fare + min fare for tapping into Embankment

## Scenario 4: Penalty fare: User taps out without tapping in
card = Card.new
card.top_up(10)
card.tap_out(Embankment)
card.balance
=> balance reduced by penalty fare + min fare for tapping out without tapping in
