//
//  Question.swift
//  GnoME usingData
//
//  Created by user232149 on 4/1/23.
//

import SwiftUI

struct Question: View {
    
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }()
    
    
    let questions = [
        "2023-04-01": "What are you excited for?",
        "2023-04-02": "What's the weirdest thing you've ate recently",
        "2023-04-03": "What is your favorite movie?",
        "2023-04-04": "What is your favorite book?"
    ]
    
    var body: some View {
        ZStack {
                    Rectangle()
                    .fill(Color(hue: 0.034, saturation: 0.807, brightness: 0.855))
                    .cornerRadius(15)
                    .padding(.vertical, -20)
                    .frame(width: 370)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.black, lineWidth: 2)
                            .padding(.vertical, -20)
                        )
                    .shadow(radius: 2)
                    
            VStack (alignment: .leading) {
                        Text("Today's Question:")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                      
                Text(questions["2023-04-01"] as! String)
                    .font(.title)
                    .foregroundColor(.white)
                
                       /* if let question = questions[dateFormatter.string(from: Date())] {
                            Text(question)
                                .font(.title)
                                .foregroundColor(.white)
                        } else {
                            Text("No question found for today.")
                                .font(.title)
                                .foregroundColor(.white)
                        }*/
                    }
                }
        .padding(.vertical, 20)
            }
        }


struct Question_Previews: PreviewProvider {
    static var previews: some View {
        Question()
    }
}
