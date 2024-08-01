import SwiftUI

@main
struct MentalHealthApp: App {
    var body: some Scene {
        WindowGroup {
            MentalHealthScreen()
        }
    }
}

struct MentalHealthScreen: View {
    @State private var currentQuestionIndex = 0
    @State private var responses: [Int] = []
    
    let questions: [SurveyQuestion] = [
        SurveyQuestion(text: "How have you been sleeping lately?",
                       options: ["I sleep well through the night and wake up feeling rested.",
                                 "I have trouble falling or staying asleep and often wake up feeling tired.",
                                 "I have sudden, intense awakenings in the middle of the night feeling panicked."]),
        SurveyQuestion(text: "Have you noticed any changes in your appetite or eating habits?",
                       options: ["My appetite and eating habits have been normal.",
                                 "I have been eating more or less than usual and not feeling hungry or overly hungry.",
                                 "I lose my appetite completely during intense, sudden episodes of fear."]),
        SurveyQuestion(text: "How do you feel about your ability to manage daily tasks and responsibilities?",
                       options: ["I feel capable and on top of my tasks and responsibilities.",
                                 "I sometimes struggle to manage my tasks and feel overwhelmed.",
                                 "I feel completely unable to manage tasks due to sudden overwhelming fear or terror."]),
        SurveyQuestion(text: "How often do you feel tense, nervous, or on edge throughout the day?",
                       options: ["Rarely, I generally feel calm and relaxed.",
                                 "Occasionally, I feel tense or nervous but can manage it.",
                                 "Frequently, I feel sudden, intense fear that peaks within minutes."])
    ]
    
    var body: some View {
        VStack {
            if currentQuestionIndex < questions.count {
                QuestionView(question: questions[currentQuestionIndex],
                             onOptionSelected: { index in
                                responses.append(index)
                                currentQuestionIndex += 1
                             })
            } else {
                ResultsView(responses: responses)
            }
        }
        .padding()
    }
}

struct QuestionView: View {
    let question: SurveyQuestion
    let onOptionSelected: (Int) -> Void
    
    var body: some View {
        VStack {
            Text(question.text)
                .font(.headline)
                .padding(.bottom, 20)
            
            ForEach(0..<question.options.count, id: \.self) { index in
                Button(action: {
                    onOptionSelected(index)
                }) {
                    Text(question.options[index])
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.bottom, 10)
                }
            }
        }
    }
}

struct ResultsView: View {
    let responses: [Int]
    
    var body: some View {
        VStack {
            Text("Results")
                .font(.headline)
                .padding(.bottom, 20)
            
            Text(feedbackMessage())
                .padding()
        }
    }
    
    func feedbackMessage() -> String {
        let panicCount = responses.filter { $0 == 2 }.count
        let anxietyCount = responses.filter { $0 == 1 }.count
        
        if panicCount > 1 {
            return "You might be experiencing symptoms of a panic attack. Consider seeking professional help."
        } else if anxietyCount > 1 {
            return "You might be experiencing anxiety. It may be helpful to explore stress management techniques or consult a professional."
        } else {
            return "Your responses suggest that you are managing well, but if you experience any troubling symptoms, consider seeking support."
        }
    }
}

struct SurveyQuestion {
    let text: String
    let options: [String]
}
struct MentalHealthScreen_Previews : PreviewProvider{
    static var previews: some View{
        MentalHealthScreen()
    }
}
