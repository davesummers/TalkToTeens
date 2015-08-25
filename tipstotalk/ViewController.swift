//
//  ViewController.swift
//  tipstotalk
//
//  Created by Zac Summers on 7/26/15.
//  Copyright (c) 2015 Zachary Summers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var Question: UILabel!
    
    private let dayOfYear = 0
    private let firstDayOfYear = NSDate()
    private var questionDate = NSDate()

    var questionList: [String] = [
        "What new years resolutions do you want to make this year?  Are there resolutions that we should make together as a family?", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","What new years resolutions do you think are most often made?  Which resolutions do you think are the most frequently given up on?","List three foods you would like to try.","Would you rather never have to sleep or never have to eat?","What class have you learned the most in?  What class have you learned the least in?","What lines do you dread waiting in?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)",
        "Which class has your favorite group of students in it? Which class has the worst group of students?", "What do you think is the most annoying sound in the world?", "Which day is the best day of the week?  Which day is the worst?","When you are an adult which do you think you will do most often:  eat out or cook at home?","What is a book that you would reccommend for me to read?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have you ever lost something that you still wish you could find again?  What was it?  Do you think it's possible to ever find it again?","What is your favorite type of weather?  Why?","If you could schedule the perfect night of televeision viewing what shows would be in the line up?",
        "Would you rather be lost in space or lost at sea?", "Besides walking to their next classes, what else do people do in the halls in between classes?", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","You have already accepted a date from someone else when the person you really want to go out with calls and asks you for a date on the same night.  What do you do?","Which is better: ham, bacon, pork chops, or none of the above.","Who is the funniest person that you know?","If they played music in the halls at school what would everyone want them to play over the loudspeaker?","Which relative's house is the best to visit?  Which one is the worst?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)",
        "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "If you could invent a new gum flavor what woud it be?", "If your life was a book, what would the title be?","What is the worst storm that you remember going through?","Do you wanna build a snowman?","What is the biggest success you have had this week?  The biggest disappointment?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","What is your favorite family tradition?","Tell me one thing that you learned today.",
        "If you could have a package delivered to you right this second what would be inside of it?  Who would have sent it?", "If you could hold any Guiness World Record which record would you like to hold?", "List 5 people who you love.","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","If you could have the power to look into the future and see any one day from your future what day would you choose to see?","How would one of your teachers at school describe you?","Is being courteous still something important to teach and be or is it just 'old fashioned?'","Name three things that should never be cold.","What would be your ideal car?",
        "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "Would you rather eat chocolate covered potato chips, chocolate covered ants, chocolate covered jalepenos, or chocolate covered bacon?","If your date had bad breath would you tell them, give them a piece of gum, or not say anything?","What is the best gift you've ever recieved?  What is the worst?","Tell me one question that you had today…even if it wasn’t answered….actually, especially if it wasn’t answered…","If you could be a celebrity for the day who would you choose to be?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "What super power is the best?  Which one is the most pointless?",
        "What do you think the most important part of school is?", "A friend asks to borrow some money from you.  Do you lend it to them?  Does the amount of money they want to borrow make a difference?", "If you could change the ending to any book what book would you choose and how would it end?", "What is the best television show of all times?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","What classmate is most likely to be arrested, made president, become a millionaire, be in movies, let loose a flock of wild chickens in the library, etc.","What is you least favorite chore around the house?","Who is the first friend you can remember?","List 3 jobs that you never want to have.",
        "If you could change one thing about the way you look what would it be?", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","What do you think are the best and worst inventions ever?","If someone gave you $1,000 what would you buy?","What would your school be better with? What would your school be better without?","Would it be scarier to sky dive or deep sea dive?  Would either be fun?  Which one are you most likely to try?","What law would you like to change?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)",
        "If Superman fought Darth Vader, who would win and how would they win?", "If you could ask me any one question what would you ask?", "If you had to give up one of your five senses which one would you choose to give up?  Why?","If you could magically make a change that would make things easier for your gender what change would you make?","If you could read minds what teachers mind would you read? What classmates mind would you read? Whose mind would you NOT want to read?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","If you had to spend the rest of your life with the person of your choice tied to your ankle who would you choose to be tied to and why?","Describe a typical lunch hour?","If you could own the world's largest collection of something what would your collection be of?  Where would you keep it?",
        "Has technology simplified or complicated our lives?", "If you were a donut what kind would you be?  Why?  Would you have sprinkles? What about me?", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","If you had to go to only one class every day which class would it be?","Whose closet would you like to explore?  Would your answer change if you were allowed to keep whatever you wanted from inside of it?","What would your perfect day look like?","What are two things that make you unique?","What is the most pressing issue or biggest problem at your school?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)",
        "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "Would you rather be with a group of people or by yourself?", "What is cool right now that you don't think will be cool in 5 years?","If our family suddenly had to move, where would you choose for us to relocate?  Would you be sad or excited?","Using 5 words, describe your bedroom.","Do you think students should still practice handwriting or should they just practice keyboarding?  Why?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","If you could hang out with anyone for the day who woud it be?  What would you do?","What would you rather be famous for:  singing, playing sports, inventing, or winning the Nobel Peace Prize?",
        "If you could relive any one day from your past what day would you choose?", "If our house was on fire and you could only save one thing (aside from the people who live in it) what would you save?", "What is something that you would like to do before you graduate from highschool?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","What is your best subject in school?  Worst?","Which cartoon character are you the most like?  What about me?","What is one of your earliest memories?  Why do you think you remember that?","If you could do something that has never been done before, what would you do?","Who would you like to block from your phone?  Whose number would you like in your contact list?",
        "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "If you had to be in an eating contest which food do you think you would have the best chance at eating the most of?","Do you thinking texting instead of talking hurts, helps, or makes no difference with relationships?","What would be the most annoying song to have stuck in your head?","Are you usually the first person to speak up in a group or the last?  Why do you think that is?","When you get home from school you find that your friend accidentally put their diary in your backpack.  What do you do?  Do you read it or not?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","What was the coolest (saddest, funniest, scariest) thing that you saw today.",
        "List three jobs that you think will be very important to have filled in the future.", "Who do you think you could be nicer to?", "Who would you least like to be stuck in an elevator with?  Who would be the best person to be stuck in an elevator with?","What age do you think 'the best time of life' is?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","If today had a theme song what would it be?","What is one thing you'd like your friends to know about you?","What was your favorite book to read in elementary school?","What should they teach at school that they aren't teaching right now?  Is there anything they don't need to be teaching?",
        "List 3 things you can do with your eyes closed.", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","If you invented an APP what would it do?","What is the first thing you are going to do after you graduate from high school?","If you could get paid to do something you like to do what would it be?","What do you think you will be doing at this exact moment 5 years from now?  10 years?  20 years?  50 years?","If you could take a 1 day trip to anywhere where would you go and what would you do?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)",
        "Which do you choose hot, medium, or mild?", "If you could invent a new soda flavor what would it be?", "You are in a parking lot and accidentally ding the car next to you when you open the door.  No one sees it happen and no one is around.  Do you wait for the other driver to come out so you can talk to them, leave a note on the windshield, or hop in your car and drive like the wind?","Would you rather spend summer vacation on a beach in Hawaii, visiting New York City, or climbing Mt. Everest?","If there was a movie made about your life who would you want to play the part of you?  What about me?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Does everything really taste better with bacon?","If you could work for anyone in the world, who would you work for and what would you do?","What do you think others like best about you?",
        "If you had a boat, what would you name it?", "If you were making a time capsle that was to be opened in 100 years from now what 5 things would you put inside it to show the future what your life is like now.", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","What is one of the hardest decisions you've ever had to make?","If you could only use 10 word for the rest of you life what 10 words would you choose?","Do you like the quiet or would you rather be surrounded by some kind of noise?","Tell me about an embarrassing moment. (That happened to you or someone else.)","What is the best song of all times?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)",
        "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "Where would the best and worst place to go on family vacation be?","If you had to be transformed into a plant of somekind what plant would you choose and where would you be planted?","Name three jobs that you think will be obsolete in the future?","If you could be the world champion at any one sport which sport would you be the champion of?","What was your favorite toy when you were a kid?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Someone stole your bike but the police call and tell you they found it!  When you go to the police station you see the bike isn't yours.  In fact it's a lot nicer.  But the police think it's yours and want you to take it home.  What do you do?","List 3 things that you just can't live without?",
        "If you could rent out a movie theater for one movie, what would it be?","If either plants or animals could talk which ones would you rather communicate with?  And how would that change how the world functions???","What is something you are proud of?","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)","Which would you rather have to face: a bear, a shark, or a tiger?","If you could have the lead role in any movie which movie would you pick and which character would you be?","Are there any inventions that you think make life harder instead of easier?","If someone came to visit our area from out of town what 3 places would you tell them to visit?","If you could have been the first person to discover any part of the world what location would you have wanted to discover?",
        "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "Have a great weekend and tell your teens that you love them! (And feel free to scroll back to find any questions you might have missed.)", "If you could go back in time to any era when and where would you go?","List 3 things that you know are true.","Pebble, crushed, cubed, or no ice?","If you could ask your grandpa one thing what would it be?",        "If you could only go on one amuesment park ride ever again which one would you choose?","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
        "Q1", "Q2", "Q3","Q4","Q5","Q6", "Q7"
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
    Question.text = questionList[dayOfYear]
        
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
            
            var updatedQuestion = Int(sender.value)
            Question.text = questionList[updatedQuestion]

            let flags: NSCalendarUnit = .CalendarUnitDay | .CalendarUnitYear
            let date = NSDate()
            let components = NSCalendar.currentCalendar().components(flags, fromDate: date)
            
            let calendar = NSCalendar.currentCalendar()
            
            components.day = updatedQuestion + 1
            
            questionDate = calendar.dateFromComponents(components)!
            let dateFormatter = NSDateFormatter()
            var theDateFormat = NSDateFormatterStyle.ShortStyle
            dateFormatter.dateStyle = theDateFormat
            dateLabel.text = dateFormatter.stringFromDate(questionDate)
    
     
    }

}






















