//
//  ViewController.swift
//  TomSword
//
//  Created by Tom Schulz on 2014-12-01.
//  Copyright (c) 2014 Tom Schulz. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var M = MonsterLibrary()
        M.loadMonstersFromJSONFile()
//      Monster Iterating code to print up each monster
        printMonsters()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}



class hitThing : NSObject
{
    var hitPoints : Int
    
    init(hp: Int) {
        self.hitPoints = hp
        super.init()
    }

}

class damagedThing : hitThing
{
    var currentHitPoints : Int
    
    init(hp: Int, damageLevel: Int)
    {
        self.currentHitPoints = 0
        super.init(hp: hp)
        self.currentHitPoints = hp / damageLevel
    }
}

// I wrote this function to make sure that I would really be able to pull the monster information up.  It works like a charm!
func printMonsters() {
    println("BEGIN MONSTER LIST")
    println("Total Monsters: \(monsterList.count)")
    for thisMonster in monsterList {
        var mName = thisMonster.monstName; var mLevel = thisMonster.monstLevel; var mHP = thisMonster.monstHP
        var mDMG = thisMonster.monstDMG; var mMult = thisMonster.monstMult; var mXP = thisMonster.monstXP
        var mGold = thisMonster.monstGold; var mTotDMG = mDMG * mMult
        println("\(mName)\rLEVEL:  \(mLevel)\rHit Points: \(mHP)\rDamage: \(mDMG)\rMultiplier: \(mMult)")
        println("Max Damage: \(mTotDMG)\rExperience: \(mXP)\rGold: \(mGold)")
        println("****************")
        
        
    }
}
