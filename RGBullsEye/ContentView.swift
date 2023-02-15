//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Ella Ngo on 2/4/23.
//

import SwiftUI

struct ContentView: View {
  @State var game = Game()
// state guess is of type RGB
  @State var guess: RGB
// initialize at state: does not show score
  @State var showScore = false

  var body: some View {
      
// stack things vertically
    VStack {
// creates a circle with game's target's color inside
      ColorCircle(rgb: game.target, size: 200)

      if !showScore {
// if score is NOT shown -> make conditional
        Text("R: ??? G: ??? B: ???")
// padding -> some space under the text
          .padding()
          
      } else {
// if score is shown
// Text takes a game's target's intString -> a string
        Text(game.target.intString())
          .padding()
      }
      ColorCircle(rgb: guess, size: 200)
// 2nd circle takes a guess from user
      Text(guess.intString())
        .padding()
        
// 3 color sliders for red, green, and blue
// binds this to user's guess - read-write instead of "guess" - read only
      ColorSlider(value: $guess.red, trackColor: .red)
      ColorSlider(value: $guess.green, trackColor: .green)
      ColorSlider(value: $guess.blue, trackColor: .blue)
      Button("Hit Me!") {
          self.showScore = true
// this method computes the scores for this round
          self.game.check(guess: guess)
      }
// presents a score with an alert
// Alert is a subview of contentview, which is presented when showScore is // true - when the button is hit
      .alert(isPresented: $showScore) {
        Alert(
          title: Text("Your Score"),
// create a string of the round's score
          message: Text(String(game.scoreRound)),
// user can dismiss w a button OK -> start new round
          dismissButton: .default(Text("OK")) {
              self.game.startNewRound()
// resets the guess color to gray (0.5 in everything)
              self.guess = RGB()
          })
      }
    }
  }
}


struct ColorSlider: View {
// for value property, use @Binding instead of @State because the color
    // slider view doesn't OWN this data. it receives an initial value from // its parent view and mutates it
  @Binding var value: Double
  var trackColor: Color

  var body: some View {
    HStack {
      Text("0")
      Slider(value: $value)
        .accentColor(trackColor)
      Text("255")
    }
    .padding(.horizontal)
  }
}

struct ColorCircle: View {
  let rgb: RGB
  let size: CGFloat
    
  var body: some View {
    Circle()
      .fill(Color(red: rgb.red, green: rgb.green, blue: rgb.blue))
      .frame(width: size, height: size)
  }
}
