//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Dawit Tekeste on 3/10/24.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var AnswerButton1: UIButton!
    @IBOutlet weak var AnswerButton2: UIButton!
    @IBOutlet weak var AnswerButton3: UIButton!
    @IBOutlet weak var AnswerButton4: UIButton!
    @IBOutlet weak var questionNumberAndCategoryLabel: UILabel!
    
    struct Question {
        let questionText: String
        let answers: [String]
        let correctAnswer: String
        let category: String
    }
    
    var questions = [
        Question(questionText: "What is the King of Pop?", answers: ["Micheal Jordan", "Bill Nye", "Micheal Jackson", "Chris Tucker"], correctAnswer: "Micheal Jackson", category: "Music: Pop"),
        Question(questionText: "What country has never been colonized?", answers: ["India", "USA", "Egypt", "Ethiopia"], correctAnswer: "Ethiopia", category: "History: Colonization"),
        Question(questionText: "What player won the World Cup?", answers: ["Lionel Messi", "Cristiano Ronaldo", "David Becham", "Kylian Mbappe"], correctAnswer: "Lionel Messi", category: "Sports: Football"),
    ]
    
    
    var currentQuestionIndex = 0
    var score = 0
    
    
    func loadQuestion() {
        if currentQuestionIndex < questions.count {
            let currentQuestion = questions[currentQuestionIndex]
            QuestionLabel.text = currentQuestion.questionText
            questionNumberAndCategoryLabel.text = "Question: \(currentQuestionIndex + 1)/\(questions.count)  \n\(currentQuestion.category)"
                    
            
            AnswerButton1.setTitle(currentQuestion.answers[0], for: .normal)
            AnswerButton2.setTitle(currentQuestion.answers[1], for: .normal)
            AnswerButton3.setTitle(currentQuestion.answers[2], for: .normal)
            AnswerButton4.setTitle(currentQuestion.answers[3], for: .normal)
        } else {
            
        }
    }
    
    
    func showFinalScore(){
        let alert = UIAlertController(title: "Quiz Complete", message: "Your score is \(score)/\(questions.count).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            // Reset the quiz
            self.restartQuiz()
        }))
        self.present(alert, animated: true)
    }
    
    func restartQuiz(){
            currentQuestionIndex = 0
            score = 0
            
            loadQuestion()
    }
    
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            sender.backgroundColor = UIColor.clear
            
            if self.currentQuestionIndex < self.questions.count - 1 {
                self.currentQuestionIndex += 1
                self.loadQuestion()
            } else {
                self.showFinalScore()
            }
            
            
        }
    }
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadQuestion()
        QuestionLabel.layer.cornerRadius = 10
        QuestionLabel.layer.masksToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
