// This playground shows how to use the "filter" method to create a new array with a subset of items
// www.glitchedheart.com 


// declare the types of creatures
enum CreatureType {
	case ground,
	flying,
	water
}

// declar the Creature structure to hold information for each item
struct Creature {
	var name : String
	var type : CreatureType
	
	var hp : Int
}

var creatureArray : [Creature] = [Creature]()

// fill the array with default creatures
creatureArray.append(Creature(name: "Dragon", type: .flying, hp: 500))
creatureArray.append(Creature(name: "Raven", type: .flying, hp: 50))
creatureArray.append(Creature(name: "Thunderbird", type: .flying, hp: 400))
creatureArray.append(Creature(name: "Mothra", type: .flying, hp: 1500))

creatureArray.append(Creature(name: "Cow", type: .ground, hp: 200))
creatureArray.append(Creature(name: "Slime", type: .ground, hp: 10))
creatureArray.append(Creature(name: "Warthog", type: .ground, hp: 500))

creatureArray.append(Creature(name: "Dolphin", type: .water, hp: 100))
creatureArray.append(Creature(name: "Kraken", type: .water, hp: 500))
creatureArray.append(Creature(name: "Jellyfish", type: .water, hp: 5))



// old style of creating an array with only creatures of type water
var waterCreatures : [Creature] = [Creature]()
for creature in creatureArray {
    if (creature.type == .water) {
        waterCreatures.append(creature)
    }
}

// print out the list of water creatures
print ("Water Creatures")
for creature in waterCreatures {
    print(creature.name)
}



// create a new array of water creatures by filtering the creatureArray with a full syntax closure
let filteredWaterCreatures = creatureArray.filter { (creature) -> Bool in
    return creature.type == .water
}

// print out the filtered water creatures using foreach and a full syntax closure
print ("\nFiltered Water Creatures")
filteredWaterCreatures.forEach { (creature) in
    print(creature.name)
}



// create an array of only flying creatures using the shorthand closure syntax
let flyingCreatures = creatureArray.filter( { $0.type == .flying } )

// print out the list of flying creatures
print ("\nFiltered Flying Creatures")
flyingCreatures.forEach({ print($0.name) })



// Filter out all weak creatures regardless of type
let weakCreatures = creatureArray.filter( { $0.hp < 100 } )

// print out the list of weak creatures
print ("\nFiltered Weak Creatures")
weakCreatures.forEach({ print($0.name) })



// filter out strong flying creatures using full closure syntax
let strongFlyingCreatures = creatureArray.filter { $0.hp > 100 && $0.type == .flying
}

// print out the list of strong flying creatures
print ("\nFiltered Strong Flying Creatures")
strongFlyingCreatures.forEach({ print($0.name) })
