#  The way things should be...

## Game is too big!!
The Game object is HUGE as it is responsible for creating all objects, holding all the objects, and providing methods for every action in the game.
- [ ] There should be a GameFactory the builds the Game that holds all the required objects (Board, Bank, Players, Red Shift Deck, and Game Master) and initializes their states appropriately.
- [ ] Each created object should hold their own state and provide methods accordingly.
- [ ] There should be a Game object that simply holds these objects
- [ ] The Game Master provides the externally facing interface for all use cases and actions.

## Game Master
This should be responsible for all turn information. This includes the current player, the state of their turn, and who is in/out of the game. It also provides the facade for all game actions.

### Player actions
- Buy unowned property at current location
  -- GM will use another object (Realtor?) to do this
    -- Game Master verifies 
      --- with Bank that property is for sale and price
      --- with Board if a fuel station is placed, adds 500 to price if so
      --- with Player to verify funds are available
    -- GM -> Deducts price from Player's funds
    -- GM -> Bank releases property card
    -- GM adds property card to Player
- Sell any owned property
- Place Fuel Station on any owned property
- Buy fuel from current location
- Buy fuel station
- Roll and do as required (move, use fuel, pay rent, lose?)
- Fire lasers
- End turn

## Board should be a state machine
The board should have a state and simple actions to mutate state. The locations, paths, and order of players are immutable, but the current player, player positions, and placed fuel stations are mutable.
- list all locations in order
- list all connections between locations
- provide location info for any location index
- change current player position
- place fuel stations
- answer: does it have a fuel station on it?

## Location is immutable info
The board will hold this data in the locations array. This is only the immutable data applicable to each location. It includes property card info and info found writen on the physical board or in the rule book.
- Type (blue dot, black dot, body group, space dock, lab, fed station)
- Name
- Price (nil if not ownable)
- Rent Schedule (nil if n/a)
- CostsFuelToBlastOff? (t/f)
- HasFuelWithoutFuelStation?
- CanPlaceFuelStation?
- CostOfFuel (nil if cannot provide fuel)
- LandingBonusFederons (nil if n/a)
- LandingBonusFuelStations (nil if n/a)
- ImageName
- Fun Facts

## Player should be a state machine
Player has mutable state data. This includes money, unplaced fuel stations, fuel status, and owned property. The Board holds the current position of each player. Each player object will be asked if they own a certain location to determine if a location is owned and by whom. 

## Bank
This holds the total number of fuel stations distributed. The game master will not distribute more fuel stations than allowed. The bank also "owns" all unowned property, so it can be asked if it a certain location is owned or not.

## Red Shift Deck
This object holds the immutable information for each red shift card and card ordering, and the mutable next card index.
- provide next red shift card info and update index

### Red Shift Card
Enum with associated values
- Discover(message:bonus:)
- MeteorShower(message:fuel:)
- FuelLeak(message:)
- OxygenLeak(message:)
- AdvanceTo(message:index:fuel:)
- RedShift(message:multiplier:fuel:)
- LoseDisputeWithFederation(message:)
- WinDisputeWithFederation(message:)
- LoseDisputeWithPlayer(message:)
- WinDisputeWithPlayer(message:)
- LaserWarAdvance(message:)
- LaserWarShoot(message:)
- TurboLaser(message:)
