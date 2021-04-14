//
//  UserDummy.swift
//  bridge_proto
//
//  Created by Novianto Hermawan on 13/04/21.
//

import UIKit


struct FeedPost {
    let photo: UIImage
    let name: String
    let profession: String
    let time: String
    let post: String
}
    
var feedPostData : [FeedPost] = [
    FeedPost(photo:UIImage(named: "profileImage")!, name: "felin",profession: "singer",time: "4 hours ago",post: "We are back open for sessions and can't wait to work on your next project!"),
    FeedPost(photo:UIImage(named: "felin")!, name: "Felin",profession: "keyboard",time: "6 hours ago",post: "We are back open for sessions and can't wait to work on your next project!"),
    FeedPost(photo:UIImage(named: "octo")!, name: "Octo",profession: "drumer",time: "3 hours ago",post: "How To Find A Music Producer That Is Perfect For You"),
    FeedPost(photo:UIImage(named: "adhit")!, name: "Adhitya",profession: "guitarist",time: "1 hours ago",post: "Supporting local musicians not only helps the local economy, but the community as well. It keeps local venues, restaurants/bars, and music appreciation lively and strong!"),
    FeedPost(photo:UIImage(named: "William")!, name: "William",profession: "guitarist",time: "30 minutes ago ago",post: "Why would I pursue the best books for aspiring musicians? The relationship between music and books isn’t an immediately obvious one."),
    FeedPost(photo:UIImage(named: "vian")!, name: "vian",profession: "Produser",time: "25 minutes ago",post: "let's burn this stage"),
    
]

struct FeedGuide {
    let photo: UIImage
    let backgroundPhoto: UIImage
    let name: String
    let guideTitle: String
}

var feedGuideData: [FeedGuide] = [
    FeedGuide(photo:UIImage(named: "vian")!,backgroundPhoto:UIImage(named: "mixer")!, name:"Vian", guideTitle:"Writing music in GarageBand"),
    FeedGuide(photo:UIImage(named: "felin")!,backgroundPhoto:UIImage(named: "piano")!, name:"Felin", guideTitle:"What Is A Soundcheck & How To Properly Do One"),
    FeedGuide(photo:UIImage(named: "octo")!,backgroundPhoto:UIImage(named: "scrm")!, name:"Octo", guideTitle:"Scream Therapy: 5 Reasons Why Screaming Is Good for You"),
    FeedGuide(photo:UIImage(named: "adhit")!,backgroundPhoto:UIImage(named: "mic")!, name:"Adhit", guideTitle:"How to Take Care of Your Microphones"),
    FeedGuide(photo:UIImage(named: "William")!,backgroundPhoto:UIImage(named: "keys")!, name:"William", guideTitle:"How to Autotune (Properly!)"),
]


    
struct ProfilePost {
    let photo: UIImage
    let name: String
    let stageName: String
    let time: String
    let post: String
}


var profilePostData: [ProfilePost] = [
    ProfilePost(photo:UIImage(named: "vian")!, name: "Vian", stageName: "@Glmvn", time: "4 hours ago", post: "let's burn this stage"),
    ProfilePost(photo:UIImage(named: "vian")!, name: "Vian", stageName: "@Glmvn", time: "7 hours ago", post: "i need a music producer for my next project"),
    ProfilePost(photo:UIImage(named: "vian")!, name: "Vian", stageName: "@Glmvn", time: "9 hours ago", post: "Knowing the Mac Keyboard Symbols is helpfull"),
    ProfilePost(photo:UIImage(named: "vian")!, name: "Vian", stageName: "@Glmvn", time: "10 hours ago", post: "finally my garageband can be used to work again")
]

struct ProfileGuide {
    let backgoundPhoto: UIImage
    let title: String
}

var profileGuideData: [ProfileGuide] = [
    ProfileGuide(backgoundPhoto:UIImage(named: "mixer")!, title: "Writing music in GarageBand"),
    ProfileGuide(backgoundPhoto:UIImage(named: "mic")!, title: "The best microphones to buy in 2021"),
    ProfileGuide(backgoundPhoto:UIImage(named: "effect")!, title: "10 Ways to Simplify Your Live Guitar Rig"),
    ProfileGuide(backgoundPhoto:UIImage(named: "think")!, title: "Basics of Synthesis and Sound Design"),
    ProfileGuide(backgoundPhoto:UIImage(named: "gtr")!, title: "How to Maintain & Care For Your Guitar "),
    ProfileGuide(backgoundPhoto:UIImage(named: "snd")!, title: "What are the four different types of noise?")
]
