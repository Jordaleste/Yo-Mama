//
//  ContentView.swift
//  Yo Mama
//
//  Created by Charles Eison on 3/24/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    let jokeBrain = JokeBrain()
    let synthesizer = AVSpeechSynthesizer()
    @State private var joke = "Press the button for a yo-mama joke!"
    
    func getNewJoke() {
        joke = jokeBrain.getJoke()
        let utterance = AVSpeechUtterance(string: joke)
        synthesizer.speak(utterance)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            exit(-1)
        }
    }
    var body: some View {
        VStack {
            Text(joke)
                .padding()
            Button("Press me") {
                getNewJoke()
            }
        }
        .onAppear(perform: {
            getNewJoke()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
