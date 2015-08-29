//
//  ViewController.swift
//  tipstotalk
//
//  Created by Zac Summers on 7/26/15.
//  Copyright (c) 2015 Simple Simon and Co. All rights reserved.
//

import UIKit


func ==(lhs: QuestionDay, rhs: QuestionDay) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class QuestionDay: Hashable {
    var dayofYear: Int
    var month: Int
    var day: Int
    var year: Int
    var hashValue: Int {
        return String(format: "%02d:%02d", self.month, self.day).hashValue
    }
    
    init(month: Int, day: Int) {
        self.month = month
        self.day = day
        if(month < 8) {
            self.year = 2016
        } else {
            self.year = 2015
        }
        self.dayofYear = 0
    }
    init(month: Int, day: Int, year: Int)
    {
        self.month = month
        self.day = day
        self.year = year
        self.dayofYear = 0
    }

}



class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var Question: UILabel!
    
    private let dayOfYear = 0
    private let firstDayOfYear = NSDate()
    private var questionDate = NSDate()


    var questionList: [QuestionDay : String] = [
        QuestionDay(month: 1, day:  1) : "What new years resolutions do you want to make this year?  Are there resolutions that we should make together as a family?",
        QuestionDay(month: 1, day:  2) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 1, day:  3) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 1, day:  4) : "What new years resolutions do you think are most often made?  Which resolutions do you think are the most frequently given up on?",
        QuestionDay(month: 1, day:  5) : "List three foods you would like to try.",
        QuestionDay(month: 1, day:  6) : "Would you rather never have to sleep or never have to eat?",
        QuestionDay(month: 1, day:  7) : "What class have you learned the most in?  What class have you learned the least in?",
        QuestionDay(month: 1, day:  8) : "What lines do you dread waiting in?",
        QuestionDay(month: 1, day:  9) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 1, day: 10) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 1, day: 11) : "Which class has your favorite group of students in it? Which class has the worst group of students?",
        QuestionDay(month: 1, day: 12) : "What do you think is the most annoying sound in the world?",
        QuestionDay(month: 1, day: 13) : "Which day is the best day of the week?  Which day is the worst?",
        QuestionDay(month: 1, day: 14) : "When you are an adult which do you think you will do most often:  eat out or cook at home?",
        QuestionDay(month: 1, day: 15) : "What is a book that you would recommend for me to read?",
        QuestionDay(month: 1, day: 16) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 1, day: 17) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 1, day: 18) : "Have you ever lost something that you still wish you could find again?  What was it?  Do you think it's possible to ever find it again?",
        QuestionDay(month: 1, day: 19) : "What is your favorite type of weather?  Why?",
        QuestionDay(month: 1, day: 20) : "If you could schedule the perfect night of television viewing what shows would be in the line up?",
        QuestionDay(month: 1, day: 21) : "Would you rather be lost in space or lost at sea?",
        QuestionDay(month: 1, day: 22) : "Besides walking to their next classes, what else do people do in the halls in between classes?",
        QuestionDay(month: 1, day: 23) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 1, day: 24) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 1, day: 25) : "You have already accepted a date from someone else when the person you really want to go out with calls and asks you for a date on the same night.  What do you do?",
        QuestionDay(month: 1, day: 26) : "Which is better: ham, bacon, pork chops, or none of the above.",
        QuestionDay(month: 1, day: 27) : "Who is the funniest person that you know?",
        QuestionDay(month: 1, day: 28) : "If they played music in the halls at school what would everyone want them to play over the loudspeaker?",
        QuestionDay(month: 1, day: 29) : "Which relative's house is the best to visit?  Which one is the worst?",
        QuestionDay(month: 1, day: 30) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 1, day: 31) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 2, day:  1) : "If you could invent a new gum flavor what would it be?",
        QuestionDay(month: 2, day:  2) : "If your life was a book, what would the title be?",
        QuestionDay(month: 2, day:  3) : "What is the worst storm that you remember going through?",
        QuestionDay(month: 2, day:  4) : "Do you wanna build a snowman?",
        QuestionDay(month: 2, day:  5) : "What is the biggest success you have had this week?  The biggest disappointment?",
        QuestionDay(month: 2, day:  6) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 2, day:  7) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 2, day:  8) : "What is your favorite family tradition?",
        QuestionDay(month: 2, day:  9) : "Tell me one thing that you learned today.",
        QuestionDay(month: 2, day: 10) : "If you could have a package delivered to you right this second what would be inside of it?  Who would have sent it?",
        QuestionDay(month: 2, day: 11) : "If you could hold any Guinness World Record which record would you like to hold?",
        QuestionDay(month: 2, day: 12) : "List 5 people who you love.",
        QuestionDay(month: 2, day: 13) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 2, day: 14) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 2, day: 15) : "If you could have the power to look into the future and see any one day from your future what day would you choose to see?",
        QuestionDay(month: 2, day: 16) : "How would one of your teachers at school describe you?",
        QuestionDay(month: 2, day: 17) : "Is being courteous still something important to teach and be or is it just 'old fashioned?'",
        QuestionDay(month: 2, day: 18) : "Name three things that should never be cold.",
        QuestionDay(month: 2, day: 19) : "What would be your ideal car?",
        QuestionDay(month: 2, day: 20) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)",
        QuestionDay(month: 2, day: 21) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 2, day: 22) : "Would you rather eat chocolate covered potato chips, chocolate covered ants, chocolate covered jalepenos, or chocolate covered bacon?",
        QuestionDay(month: 2, day: 23) : "If your date had bad breath would you tell them, give them a piece of gum, or not say anything?",
        QuestionDay(month: 2, day: 24) : "What is the best gift you've ever received?  What is the worst?",
        QuestionDay(month: 2, day: 25) : "Tell me one question that you had today...even if it wasn't answered...actually, especially if it wasn't answered...",
        QuestionDay(month: 2, day: 26) : "If you could be a celebrity for the day who would you choose to be?",
        QuestionDay(month: 2, day: 27) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 2, day: 28) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 2, day: 29) : "What super power is the best?  Which one is the most pointless?",		//what super power is the best.....is the Feb 29 question
        QuestionDay(month: 3, day:  1) : "What do you think the most important part of school is?",
        QuestionDay(month: 3, day:  2) : "A friend asks to borrow some money from you.  Do you lend it to them?  Does the amount of money they want to borrow make a difference?",
        QuestionDay(month: 3, day:  3) : "If you could change the ending to any book what book would you choose and how would it end?",
        QuestionDay(month: 3, day:  4) : "What is the best television show of all times?",
        QuestionDay(month: 3, day:  5) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 3, day:  6) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 3, day:  7) : "What classmate is most likely to be arrested, made president, become a millionaire, be in movies, let loose a flock of wild chickens in the library, etc.",
        QuestionDay(month: 3, day:  8) : "What is you least favorite chore around the house?",
        QuestionDay(month: 3, day:  9) : "Who is the first friend you can remember?",
        QuestionDay(month: 3, day: 10) : "List 3 jobs that you never want to have.",
        QuestionDay(month: 3, day: 11) : "If you could change one thing about the way you look what would it be?",
        QuestionDay(month: 3, day: 12) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 3, day: 13) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 3, day: 14) : "What do you think are the best and worst inventions ever?",
        QuestionDay(month: 3, day: 15) : "If someone gave you $1,000 what would you buy?",
        QuestionDay(month: 3, day: 16) : "What would your school be better with? What would your school be better without?",
        QuestionDay(month: 3, day: 17) : "Would it be scarier to sky dive or deep sea dive?  Would either be fun?  Which one are you most likely to try?",
        QuestionDay(month: 3, day: 18) : "What law would you like to change?",
        QuestionDay(month: 3, day: 19) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 3, day: 20) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 3, day: 21) : "If Superman fought Darth Vader, who would win and how would they win?",
        QuestionDay(month: 3, day: 22) : "If you could ask me any one question what would you ask?",
        QuestionDay(month: 3, day: 23) : "If you had to give up one of your five senses which one would you choose to give up?  Why?",
        QuestionDay(month: 3, day: 24) : "If you could magically make a change that would make things easier for your gender what change would you make?",
        QuestionDay(month: 3, day: 25) : "If you could read minds what teachers mind would you read? What classmates mind would you read? Whose mind would you NOT want to read?",
        QuestionDay(month: 3, day: 26) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 3, day: 27) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 3, day: 28) : "If you had to spend the rest of your life with the person of your choice tied to your ankle who would you choose to be tied to and why?",
        QuestionDay(month: 3, day: 29) : "Describe a typical lunch hour?",
        QuestionDay(month: 3, day: 30) : "If you could own the world's largest collection of something what would your collection be of?  Where would you keep it?",
        QuestionDay(month: 3, day: 31) : "Has technology simplified or complicated our lives?",
        QuestionDay(month: 4, day:  1) : "If you were a donut what kind would you be?  Why?  Would you have sprinkles? What about me?",
        QuestionDay(month: 4, day:  2) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 4, day:  3) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 4, day:  4) : "If you had to go to only one class every day which class would it be?",
        QuestionDay(month: 4, day:  5) : "Whose closet would you like to explore?  Would your answer change if you were allowed to keep whatever you wanted from inside of it?",
        QuestionDay(month: 4, day:  6) : "What would your perfect day look like?",
        QuestionDay(month: 4, day:  7) : "What are two things that make you unique?",
        QuestionDay(month: 4, day:  8) : "What is the most pressing issue or biggest problem at your school?",
        QuestionDay(month: 4, day:  9) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 4, day: 10) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 4, day: 11) : "Would you rather be with a group of people or by yourself?",
        QuestionDay(month: 4, day: 12) : "What is cool right now that you don't think will be cool in 5 years?",
        QuestionDay(month: 4, day: 13) : "If our family suddenly had to move, where would you choose for us to relocate?  Would you be sad or excited?",
        QuestionDay(month: 4, day: 14) : "Using 5 words, describe your bedroom.",
        QuestionDay(month: 4, day: 15) : "Do you think students should still practice handwriting or should they just practice keyboarding?  Why?",
        QuestionDay(month: 4, day: 16) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 4, day: 17) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 4, day: 18) : "If you could hang out with anyone for the day who would it be?  What would you do?",
        QuestionDay(month: 4, day: 19) : "What would you rather be famous for:  singing, playing sports, inventing, or winning the Nobel Peace Prize?",
        QuestionDay(month: 4, day: 20) : "If you could relive any one day from your past what day would you choose?",
        QuestionDay(month: 4, day: 21) : "If our house was on fire and you could only save one thing (aside from the people who live in it) what would you save?",
        QuestionDay(month: 4, day: 22) : "What is something that you would like to do before you graduate from high school?",
        QuestionDay(month: 4, day: 23) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 4, day: 24) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 4, day: 25) : "What is your best subject in school?  Worst?",
        QuestionDay(month: 4, day: 26) : "Which cartoon character are you the most like?  What about me?",
        QuestionDay(month: 4, day: 27) : "What is one of your earliest memories?  Why do you think you remember that?",
        QuestionDay(month: 4, day: 28) : "If you could do something that has never been done before, what would you do?",
        QuestionDay(month: 4, day: 29) : "Who would you like to block from your phone?  Whose number would you like in your contact list?",
        QuestionDay(month: 4, day: 30) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)",
        QuestionDay(month: 5, day:  1) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 5, day:  2) : "If you had to be in an eating contest which food do you think you would have the best chance at eating the most of?",
        QuestionDay(month: 5, day:  3) : "Do you thinking texting instead of talking hurts, helps, or makes no difference with relationships?",
        QuestionDay(month: 5, day:  4) : "What would be the most annoying song to have stuck in your head?",
        QuestionDay(month: 5, day:  5) : "Are you usually the first person to speak up in a group or the last?  Why do you think that is?",
        QuestionDay(month: 5, day:  6) : "When you get home from school you find that your friend accidentally put their diary in your backpack.  What do you do?  Do you read it or not?",
        QuestionDay(month: 5, day:  7) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 5, day:  8) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 5, day:  9) : "What was the coolest (saddest, funniest, scariest) thing that you saw today.",
        QuestionDay(month: 5, day: 10) : "List three jobs that you think will be very important to have filled in the future.",
        QuestionDay(month: 5, day: 11) : "Who do you think you could be nicer to?",
        QuestionDay(month: 5, day: 12) : "Who would you least like to be stuck in an elevator with?  Who would be the best person to be stuck in an elevator with?",
        QuestionDay(month: 5, day: 13) : "What age do you think 'the best time of life' is?",
        QuestionDay(month: 5, day: 14) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 5, day: 15) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 5, day: 16) : "If today had a theme song what would it be?",
        QuestionDay(month: 5, day: 17) : "What is one thing you'd like your friends to know about you?",
        QuestionDay(month: 5, day: 18) : "What was your favorite book to read in elementary school?",
        QuestionDay(month: 5, day: 19) : "What should they teach at school that they aren't teaching right now?  Is there anything they don't need to be teaching?",
        QuestionDay(month: 5, day: 20) : "List 3 things you can do with your eyes closed.",
        QuestionDay(month: 5, day: 21) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 5, day: 22) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 5, day: 23) : "If you invented an APP what would it do?",
        QuestionDay(month: 5, day: 24) : "What is the first thing you are going to do after you graduate from high school?",
        QuestionDay(month: 5, day: 25) : "If you could get paid to do something you like to do what would it be?",
        QuestionDay(month: 5, day: 26) : "What do you think you will be doing at this exact moment 5 years from now?  10 years?  20 years?  50 years?",
        QuestionDay(month: 5, day: 27) : "If you could take a 1 day trip to anywhere where would you go and what would you do?",
        QuestionDay(month: 5, day: 28) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 5, day: 29) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 5, day: 30) : "Which do you choose hot, medium, or mild?",
        QuestionDay(month: 5, day: 31) : "If you could invent a new soda flavor what would it be?",
        QuestionDay(month: 6, day:  1) : "You are in a parking lot and accidentally ding the car next to you when you open the door.  No one sees it happen and no one is around.  Do you wait for the other driver to come out so you can talk to them, leave a note on the windshield, or hop in your car and drive like the wind?",
        QuestionDay(month: 6, day:  2) : "Would you rather spend summer vacation on a beach in Hawaii, visiting New York City, or climbing Mt. Everest?",
        QuestionDay(month: 6, day:  3) : "If there was a movie made about your life who would you want to play the part of you?  What about me?",
        QuestionDay(month: 6, day:  4) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 6, day:  5) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 6, day:  6) : "Does everything really taste better with bacon?",
        QuestionDay(month: 6, day:  7) : "If you could work for anyone in the world, who would you work for and what would you do?",
        QuestionDay(month: 6, day:  8) : "What do you think others like best about you?",
        QuestionDay(month: 6, day:  9) : "If you had a boat, what would you name it?",
        QuestionDay(month: 6, day: 10) : "If you were making a time capsule that was to be opened in 100 years from now what 5 things would you put inside it to show the future what your life is like now?",
        QuestionDay(month: 6, day: 11) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 6, day: 12) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 6, day: 13) : "Describe yourself using only three words.",
        QuestionDay(month: 6, day: 14) : "What is your favorite summer memory from childhood?",
        QuestionDay(month: 6, day: 15) : "If you could pick a famous person to move in next door who would you pick to move in?  Why?",
        QuestionDay(month: 6, day: 16) : "If you could permanently exterminate one kind of insect which one would it be?",
        QuestionDay(month: 6, day: 17) : "Who is the strangest person you've ever met?",
        QuestionDay(month: 6, day: 18) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 6, day: 19) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 6, day: 20) : "What is one of the hardest decisions you've ever had to make?",
        QuestionDay(month: 6, day: 21) : "If you could only use 10 word for the rest of you life what 10 words would you choose?",
        QuestionDay(month: 6, day: 22) : "Do you like the quiet or would you rather be surrounded by some kind of noise?",
        QuestionDay(month: 6, day: 23) : "Tell me about an embarrassing moment. (That happened to you or someone else.",
        QuestionDay(month: 6, day: 24) : "What is the best song of all times?",
        QuestionDay(month: 6, day: 25) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 6, day: 26) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 6, day: 27) : "Where would the best and worst place to go on family vacation be?",
        QuestionDay(month: 6, day: 28) : "If you had to be transformed into a plant of some kind what plant would you choose and where would you be planted?",
        QuestionDay(month: 6, day: 29) : "Name three jobs that you think will be obsolete in the future?",
        QuestionDay(month: 6, day: 30) : "If you could be the world champion at any one sport which sport would you be the champion of?",
        QuestionDay(month: 7, day:  1) : "What was your favorite toy when you were a kid?",
        QuestionDay(month: 7, day:  2) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 7, day:  3) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 7, day:  4) : "Someone stole your bike but the police call and tell you they found it!  When you go to the police station you see the bike isn't yours.  In fact it's a lot nicer.  But the police think it's yours and want you to take it home.  What do you do?",
        QuestionDay(month: 7, day:  5) : "List 3 things that you just can't live without.",
        QuestionDay(month: 7, day:  6) : "If you could rent out a movie theater for one movie, what would it be?",
        QuestionDay(month: 7, day:  7) : "If either plants or animals could talk which ones would you rather communicate with?  And how would that change how the world functions?",
        QuestionDay(month: 7, day:  8) : "What is something you are proud of?",
        QuestionDay(month: 7, day:  9) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 7, day: 10) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 7, day: 11) : "Which would you rather have to face: a bear, a shark, or a tiger?",
        QuestionDay(month: 7, day: 12) : "If you could have the lead role in any movie which movie would you pick and which character would you be?",
        QuestionDay(month: 7, day: 13) : "Are there any inventions that you think make life harder instead of easier?",
        QuestionDay(month: 7, day: 14) : "If someone came to visit our area from out of town what 3 places would you tell them to visit?",
        QuestionDay(month: 7, day: 15) : "If you could have been the first person to discover any part of the world what location would you have wanted to discover?",
        QuestionDay(month: 7, day: 16) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 7, day: 17) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 7, day: 18) : "If you could go back in time to any era when and where would you go?",
        QuestionDay(month: 7, day: 19) : "List 3 things that you know are true.",
        QuestionDay(month: 7, day: 20) : "Pebble, crushed, cubed, or no ice?",
        QuestionDay(month: 7, day: 21) : "If you could ask your grandpa one thing what would it be?",
        QuestionDay(month: 7, day: 22) : "If you could only go on one amusement park ride ever again which one would you choose?",
        QuestionDay(month: 7, day: 23) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 7, day: 24) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 7, day: 25) : "What fruit do you most resemble?  What about me?",
        QuestionDay(month: 7, day: 26) : "You don't like any of the candidates running for office.  Do you still vote?  And if so who do you vote for?",
        QuestionDay(month: 7, day: 27) : "List 5 animals that you would like to see in the wild.",
        QuestionDay(month: 7, day: 28) : "What is your favorite feature?",
        QuestionDay(month: 7, day: 29) : "List three things that should never be hot.",
        QuestionDay(month: 7, day: 30) : "If you could instantly speak another language fluently what language would it be?  Why?",
        QuestionDay(month: 7, day: 31) : "If you were going to be stranded forever on an island and could only take one book to read what book would you choose?",
        QuestionDay(month: 8, day:  1) : "If you could clone yourself would you? Why or why not?",
        QuestionDay(month: 8, day:  2) : "Would you eat an insect for $50?  And if so, what insect would you choose to eat?",
        QuestionDay(month: 8, day:  3) : "Would you rather be too hot or too cold?  Why?",
        QuestionDay(month: 8, day:  4) : "What is one talent you wish you were better at?",
        QuestionDay(month: 8, day:  5) : "Would you rather have an extra pair of arms or legs? Why?",
        QuestionDay(month: 8, day:  6) : "Were you ever accused of something that you didn't do?",
        QuestionDay(month: 8, day:  7) : "If you could change the ending to any movie what movie would you choose and how would it end?",
        QuestionDay(month: 8, day:  8) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 8, day:  9) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 8, day: 10) : "If one of your parents were any famous person from history who would you want them to be?  Why?",
        QuestionDay(month: 8, day: 11) : "Would you rather buy something on the computer or go into the store to buy it?  Why?",
        QuestionDay(month: 8, day: 12) : "List 5 things that you don't like to share.",
        QuestionDay(month: 8, day: 13) : "A large company offers to pay you $250,000 to endorse a product you don't like and would never use.  What do you do?  Would you answer change if the was dangerous?",
        QuestionDay(month: 8, day: 14) : "Who is the kindest person you know?",
        QuestionDay(month: 8, day: 15) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 8, day: 16) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 8, day: 17) : "If you could instantly be a master of playing any one musical instrument which instrument would you play?",
        QuestionDay(month: 8, day: 18) : "What is your biggest pet peeve?",
        QuestionDay(month: 8, day: 19) : "What is the first thing you think about when you wake up?",
        QuestionDay(month: 8, day: 20) : "If you could write a book about yourself, what would the title be?  Why?",
        QuestionDay(month: 8, day: 21) : "What is your favorite thing to eat on a hot day?",
        QuestionDay(month: 8, day: 22) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 8, day: 23) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 8, day: 24) : "Tell me 3 warnings or pieces of advice that you've been given?",
        QuestionDay(month: 8, day: 25) : "What was your favorite outfit to wear in elementary school?",
        QuestionDay(month: 8, day: 26) : "If you could implant yourself into a video game what game would you like to be inside?",
        QuestionDay(month: 8, day: 27) : "At school you notice that one of your friends has their shirt on inside out.  Do you tell them or not.  Why or why not?",
        QuestionDay(month: 8, day: 28) : "What is something that you worry about?",
        QuestionDay(month: 8, day: 29) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 8, day: 30) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 8, day: 31) : "If you could only wear one color for the rest of your life, what color would you pick?",
        QuestionDay(month: 9, day:  1) : "What would your dream house look like and where would it be?",
        QuestionDay(month: 9, day:  2) : "Which do you feel most comfortable doing spending or saving your money?  Why?",
        QuestionDay(month: 9, day:  3) : "If you owned a food truck what kind of food would you sell?  Where would you park it?  What would your food truck be called?",
        QuestionDay(month: 9, day:  4) : "What class has the most cute boys/girls in it?",
        QuestionDay(month: 9, day:  5) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 9, day:  6) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 9, day:  7) : "What was the last compliment that you received?",
        QuestionDay(month: 9, day:  8) : "What would a new student need to know before attending your school?",
        QuestionDay(month: 9, day:  9) : "Who did you help today? Who helped you today?",
        QuestionDay(month: 9, day: 10) : "If you could permanently stop having to do one thing everyday that you currently have to do what would it be?",
        QuestionDay(month: 9, day: 11) : "List your top 5 favorite movies of all time.",
        QuestionDay(month: 9, day: 12) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 9, day: 13) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 9, day: 14) : "What are the top 3 (or 5) things that you hear people say in the halls?",
        QuestionDay(month: 9, day: 15) : "If you, like most super heroes, had a side kick what would call him or her and what would you make them do?",
        QuestionDay(month: 9, day: 16) : "If you were going to protest something what would you protest?",
        QuestionDay(month: 9, day: 17) : "Which would be better in a food fight, peanut butter, chocolate, or spaghetti?",
        QuestionDay(month: 9, day: 18) : "What is the nicest thing anyone has ever done for you?",
        QuestionDay(month: 9, day: 19) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 9, day: 20) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 9, day: 21) : "If you could build a private retreat where would it be and what would you put inside it?",
        QuestionDay(month: 9, day: 22) : "Tell me one thing you read at school today.",
        QuestionDay(month: 9, day: 23) : "Dogs or Cats???  Hamsters or Bunnies???  Llamas or Flying Monkeys???",
        QuestionDay(month: 9, day: 24) : "You find a $100 bill laying on the grass in front of your school...do you turn it into the office, tell a teacher about it, put it in your pocket, or by me t with it?",
        QuestionDay(month: 9, day: 25) : "What app do you use the most?  What game do you play most on your phone?",
        QuestionDay(month: 9, day: 26) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 9, day: 27) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 9, day: 28) : "If you could only eat at one restaurant for the rest of your life which one would you choose?",
        QuestionDay(month: 9, day: 29) : "You are waiting at a red light really early in the morning.  There are no other cars around....do you wait for the light to turn green or do you go because after all, there is no one else around?",
        QuestionDay(month: 9, day: 30) : "If your day at school was an emoticon which one would it be?",
        QuestionDay(month: 10, day:  1) : "What are your top 3 career choices?",
        QuestionDay(month: 10, day:  2) : "What movie quote do you use the most in everyday conversation?",
        QuestionDay(month: 10, day:  3) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 10, day:  4) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 10, day:  5) : "What is the best thing that you have learned from an adult?",
        QuestionDay(month: 10, day:  6) : "If you could join any band or musical group what group would it be and what would you play?",
        QuestionDay(month: 10, day:  7) : "Is kindness a sign of weakness or strength?",
        QuestionDay(month: 10, day:  8) : "What do you think you should do more of at school? What do you think you should do less of?",
        QuestionDay(month: 10, day:  9) : "Would you rather search for buried treasure, a lost civilization, or pan for gold?",
        QuestionDay(month: 10, day: 10) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 10, day: 11) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 10, day: 12) : "If you had to be a pair of shoes what kind of shoes would you be?  Why?",
        QuestionDay(month: 10, day: 13) : "List your top 3 favorite books of all times.",
        QuestionDay(month: 10, day: 14) : "If you could read minds, whose mind would you want to read first?  What do you think you would find out?",
        QuestionDay(month: 10, day: 15) : "What would be a really great addition to our home?",
        QuestionDay(month: 10, day: 16) : "If an alien space ship landed at your school who would you like them to beam aboard and take back to their home planet?",
        QuestionDay(month: 10, day: 17) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 10, day: 18) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 10, day: 19) : "What part of the day do you look forward to? What part of the day do you dread?",
        QuestionDay(month: 10, day: 20) : "Who is your best friend?  How did you become best friends?",
        QuestionDay(month: 10, day: 21) : "If you could be famous for doing anything....what would you want to be famous for?",
        QuestionDay(month: 10, day: 22) : "Which of the 7 wonders of the world would you like to visit?  (Can you name all 7 wonders?",
        QuestionDay(month: 10, day: 23) : "Which cartoon character would you like to date?",
        QuestionDay(month: 10, day: 24) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 10, day: 25) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 10, day: 26) : "What is your favorite holiday?  Why?",
        QuestionDay(month: 10, day: 27) : "What do you think your teachers talked about in the faculty room today after school?",
        QuestionDay(month: 10, day: 28) : "What was the last thing you took a picture of?",
        QuestionDay(month: 10, day: 29) : "When you are nervous or scared what makes you feel more calm?",
        QuestionDay(month: 10, day: 30) : "What was the scariest movie that you've ever seen?  Why was it so scary?",
        QuestionDay(month: 10, day: 31) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day:  1) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day:  2) : "If you could be invisible for the day at school what would you do?",
        QuestionDay(month: 11, day:  3) : "If you could have been the inventor of an one thing from history what would you have liked to be the inventor of?",
        QuestionDay(month: 11, day:  4) : "Walking into a store you notice that someone has left their car lights on.  What do you do?  Look for the driver inside the store, tell a clerk inside the store, ignore it since it's not your problem anyway.",
        QuestionDay(month: 11, day:  5) : "What is your easiest class?  What is your hardest class?",
        QuestionDay(month: 11, day:  6) : "If you were the president of the United States what changes would you make?",
        QuestionDay(month: 11, day:  7) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day:  8) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day:  9) : "What three pieces of advice would you give to a new student at your school?",
        QuestionDay(month: 11, day: 10) : "if you had to choose would you rather give up the phone or the computer for one month?",
        QuestionDay(month: 11, day: 11) : "Would you rather have a dragon or be a dragon?",
        QuestionDay(month: 11, day: 12) : "If you had to be a member of another family which family would you choose?  Why?",
        QuestionDay(month: 11, day: 13) : "If you had to give up one of these two modern conveniences which one would it be: running water or electricity.  Why?",
        QuestionDay(month: 11, day: 14) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day: 15) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day: 16) : "If we were going to eat fast food for dinner tonight, where would we go go and what would you order?",
        QuestionDay(month: 11, day: 17) : "Who do you think knows you the very best?",
        QuestionDay(month: 11, day: 18) : "Do you think grades are a good indication of how well someone is doing in school?  If not, how could they be a better indicator?",
        QuestionDay(month: 11, day: 19) : "If you could start a new family tradition what would it be?",
        QuestionDay(month: 11, day: 20) : "Which would you choose:  Being poor but working at a job you love OR being rich and working at a job you hate?",
        QuestionDay(month: 11, day: 21) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day: 22) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day: 23) : "If your day at school today was a movie what movie would it be?",
        QuestionDay(month: 11, day: 24) : "Would you rather go back or forward in time?",
        QuestionDay(month: 11, day: 25) : "Do you think people act differently online than they do in real life?",
        QuestionDay(month: 11, day: 26) : "How would you describe our neighborhood to an outsider.",
        QuestionDay(month: 11, day: 27) : "Would you rather have to go for a week without showering or without brushing your teeth?",
        QuestionDay(month: 11, day: 28) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day: 29) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 11, day: 30) : "What do you think makes a good teacher?",
        QuestionDay(month: 12, day:  1) : "If someone gave you $1 million dollars to give away, where would you give the money?",
        QuestionDay(month: 12, day:  2) : "If you could ask your grandma one question what would it be?",
        QuestionDay(month: 12, day:  3) : "What is the best choice that you have ever made?",
        QuestionDay(month: 12, day:  4) : "What would you like to win a gold medal for?",
        QuestionDay(month: 12, day:  5) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 12, day:  6) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 12, day:  7) : "What kind of weather is your favorite?  Least favorite?",
        QuestionDay(month: 12, day:  8) : "If you had to choose 3 objects or symbol to represent you what would you pick?",
        QuestionDay(month: 12, day:  9) : "Where in the school do you hang out the most? (Like a particular hall, classroom, parking lot, etc.) Where in the school do you never hang out?",
        QuestionDay(month: 12, day: 10) : "If you could spend the weekend in any store, but not take anything with you when you leave, what store would you pick and what would you do?",
        QuestionDay(month: 12, day: 11) : "If you were a teacher what class would you teach? What class would be the worst to teach? Why?",
        QuestionDay(month: 12, day: 12) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 12, day: 13) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",
        QuestionDay(month: 12, day: 14) : "List 5 of your favorite and least favorite things to eat.",
        QuestionDay(month: 12, day: 15) : "What is the best vacation our family has been on?",
        QuestionDay(month: 12, day: 16) : "If you had to choose between whispering or shouting everything you say for the rest of your life which option would you choose?  Why?",
        QuestionDay(month: 12, day: 17) : "Tell me one way that you have changed for the better over the last year?",
        QuestionDay(month: 12, day: 18) : "If you could make any fictional character real who would it be?",
        QuestionDay(month: 12, day: 19) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",					
        QuestionDay(month: 12, day: 20) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",					
        QuestionDay(month: 12, day: 21) : "What is one thing your school is doing well at?",							
        QuestionDay(month: 12, day: 22) : "Tell me about a time when you were surprised.",							
        QuestionDay(month: 12, day: 23) : "What was the best thing and the worst thing about being a child?",							
        QuestionDay(month: 12, day: 24) : "Do you believe that saying ÔIt's better to give than receiveÕ is accurate?  Why or why not?",							
        QuestionDay(month: 12, day: 25) : "Tell me about a dream that you've had.",							
        QuestionDay(month: 12, day: 26) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",					
        QuestionDay(month: 12, day: 27) : "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.",					
        QuestionDay(month: 12, day: 28) : "What is your favorite thing to eat on a cold day?",							
        QuestionDay(month: 12, day: 29) : "What world problem would you like to solve?  Any ideas how to solve it?",							
        QuestionDay(month: 12, day: 30) : "What song would you like your alarm to wake you up playing every morning?  What song would be the most annoying?",							
        QuestionDay(month: 12, day: 31) : "What are you most excited about in the future?  What scares you the most about the future?"
        
    ]

    
override func viewDidLoad() {
    super.viewDidLoad()
   
    var localNotification: UILocalNotification = UILocalNotification()
    localNotification.alertAction = "Talk to your kids today"
    localNotification.alertBody = "Come back for the question of the day"
    localNotification.fireDate = NSDate(timeIntervalSinceNow: 259200)
    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    
    let firstDayOfYear = NSCalendar.currentCalendar().dateWithEra(1, year: NSCalendar.currentCalendar().component(.CalendarUnitYear, fromDate: NSDate()), month: 1, day: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)!
    let dayOfYear = NSCalendar.currentCalendar().components(.CalendarUnitDay, fromDate: firstDayOfYear, toDate: NSDate(), options: nil).day
 
    let calendar = NSCalendar.currentCalendar()
    let date = NSDate()
    let requestedComponents = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate:  date)
    
    var questionKey = QuestionDay(month: requestedComponents.month, day: requestedComponents.day)
    
    Question.text = questionList[questionKey]
    
    let dateFormatter = NSDateFormatter()
    var theDateFormat = NSDateFormatterStyle.ShortStyle
    dateFormatter.dateStyle = theDateFormat
    dateLabel.text = dateFormatter.stringFromDate(NSDate())
    
    var numberOfYear = Double(dayOfYear)
    
    stepper.value = numberOfYear
}
    
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepperAction(sender: UIStepper) {
        
        var updatedQuestionIndex = Int(sender.value)
        
        var unitFlags: NSCalendarUnit = (.CalendarUnitDay | .CalendarUnitYear | .CalendarUnitMonth)
        let calendar = NSCalendar.currentCalendar()
        
        var newDate = NSDate()
        var newDateComponents = NSCalendar.currentCalendar().components(unitFlags, fromDate: newDate)
        newDateComponents.day = 1
        newDateComponents.month = 1
        newDate = calendar.dateFromComponents(newDateComponents)!
        newDate = NSCalendar.currentCalendar().dateByAddingUnit(.CalendarUnitDay, value: updatedQuestionIndex, toDate: newDate, options: nil)!
        newDateComponents = NSCalendar.currentCalendar().components(unitFlags, fromDate: newDate)
        
        var newQuestionDay = QuestionDay(month: newDateComponents.month, day: newDateComponents.day)
        
        Question.text = questionList[newQuestionDay]
        
        let dateFormatter = NSDateFormatter()
        var theDateFormat = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateStyle = theDateFormat
        // removing for now  dateLabel.text = dateFormatter.stringFromDate(newDate)
    
    }

}






















