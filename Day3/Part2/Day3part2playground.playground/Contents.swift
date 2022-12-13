import Foundation

if let file = Bundle.main.url(forResource: "input", withExtension: "txt") {
    
    let data = try String(contentsOf: file, encoding: String.Encoding.utf8 )
    
    let rucksacks = data.split(separator:"\n", omittingEmptySubsequences: true)
    
    let itemWithPriority: [Character: Int] = ["a":1,"b":2,"c":3,"d":4,"e":5,"f":6,"g":7,"h":8,"i":9,"j":10,"k":11,"l":12,"m":13,
                                  "n":14,"o":15,"p":16,"q":17,"r":18,"s":19,"t":20,"u":21,"v":22,"w":23,"x":24,"y":25,
                                  "z":26,"A":27,"B":28,"C":29,"D":30,"E":31,"F":32,"G":33,"H":34,"I":35,"J":36,"K":37,
                                  "L":38,"M":39,"N":40,"O":41,"P":42,"Q":43,"R":44,"S":45,"T":46,"U":47,"V":48,"W":49,
                                  "X":50,"Y":51,"Z":52]
    
    var bagOne = Set<Character>()
    var bagTwo = Set<Character>()
    var bagThree = Set<Character>()
    var sumOfPriorities = 0
    
    for index in stride(from: rucksacks.startIndex, through: rucksacks.endIndex - 3, by: 3 ) {
        
        rucksacks[index].map{bagOne.insert($0)}
        rucksacks[index+1].map{bagTwo.insert($0)}
        rucksacks[index+2].map{bagThree.insert($0)}
        
        var repeatedItem = bagOne.intersection(bagTwo).intersection(bagThree)
        
        sumOfPriorities += itemWithPriority[repeatedItem.popFirst() ?? Character("?")] ?? -1

        bagOne.removeAll()
        bagTwo.removeAll()
        bagThree.removeAll()
    }
    
    print("\n")
    print("The sum of the priorities of the item types between all groups of elves (in groups of three) : " + String(sumOfPriorities))

} else {
    print("Error finding file")
}

