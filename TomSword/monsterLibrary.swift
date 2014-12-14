//
//  monsterLibrary.swift
//  TomSword
//
//  Created by Tom Schulz on 2014-12-02.
//  Copyright (c) 2014 Tom Schulz. All rights reserved.
//

/* Format for adding monster to JSON file:

******  MONSTER TEMPLATE  *****
,
{
"name" : "Monster Name",
"level" : Int,
"hitPoints" : Int,
"damage" : Int,
"multiplier" : Int,
"experience" : Int,
"gold" : Int
}

*/


import Foundation

var monsterList: [vcMonster] = [] // creates array to hold monsters in their class

class Monster :NSObject
{
    var name : String
    
    init(name: String) {
        self.name = name
        super.init()
    }
}

class vcMonster: NSObject {
    var monstName: String = ""
    var monstLevel: Int = 0
    var monstHP: Int = 0
    var monstDMG: Int = 0
    var monstMult: Int = 0
    var monstXP: Int = 0
    var monstGold: Int = 0
    
}


class MonsterLibrary : NSObject{
    
    var monsterArray : [Monster]
    
    override init()
    {
        self.monsterArray = Array()
        super.init()
    }
    
    
    func loadMonstersFromJSONFile()
    {
        
        if let filePath = NSBundle.mainBundle().pathForResource("monsters", ofType: "json")
        {
            if let jsonString = String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding, error: nil)
            {
                var err :NSErrorPointer = nil
                
                if let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
                {
                    println("Got JSON Data")
                    
                    var jsonDict = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: err) as? NSDictionary
                    
                    
                    
                    if let monsters = jsonDict?.objectForKey("monsters") as? NSArray
                    {
                        
                        println("NUMBER OF MONSTERS \(monsters.count)")
                        
                        let firstMonster = monsters[0] as NSDictionary
                        
                        
                        for ( index, M ) in enumerate(monsters)
                        {
                            let monsterDict = M as NSDictionary
                            let thisMonster = vcMonster()  // initializes Monster class
                            if let monsterName = M["name"] as String?
                            {
                                println("\t      name:[\(monsterName)]")
                                thisMonster.monstName = monsterName  // applies variable to class
                            }
                            if let monsterLevel = M["level"] as Int?
                            {
                                println("\t     level:[\(monsterLevel)]")
                                thisMonster.monstLevel = monsterLevel
                            }
                            if let monsterHP = M["hitPoints"] as Int?
                            {
                                println("\t        hp:[\(monsterHP)]")
                                thisMonster.monstHP = monsterHP
                            }
                            if let monsterDMG = M["damage"] as Int?
                            {
                                println("\t    Damage:[\(monsterDMG)]")
                                thisMonster.monstDMG = monsterDMG
                            }
                            if let monsterMult = M["multiplier"] as Int?
                            {
                                println("\tMultiplier:[\(monsterMult)]")
                                thisMonster.monstMult = monsterMult
                                var dmgTotal = thisMonster.monstMult * thisMonster.monstDMG
                                println("\t Total DMG: [\(dmgTotal)]")
                            }
                            
                            if let monsterXP = M["experience"] as Int?
                            {
                                println("\tExperience:[\(monsterXP)]")
                                thisMonster.monstXP = monsterXP

                            }
                            if let monsterGold = M["gold"] as Int?
                            {
                                println("\t      gold:[\(monsterGold)]")
                                thisMonster.monstGold = monsterGold
                                
                            }
                            
                            monsterList.append(thisMonster)
                            
                        }
                        
                    }
                    
                }
                
            }
        }
    }
}

