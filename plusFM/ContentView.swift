//
//  ContentView.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabBarItem = 1
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        VStack{
            switch tabBarItem {
            case 0:
                HomeView(background: "\(getBackgroundUserDefault())", index: $tabBarItem)
            case 1:
                StreamView(background: .constant("\(getBackgroundUserDefault())"),index: $tabBarItem)
            case 2:
                MoreView(index: $tabBarItem)
            default:
                NoView()
            }
        }
        .onAppear{
            setBackgroungUserDefault(background: "\(getBackgroundUserDefault())")
            if (getLanguageUserDefault() == nil) {
                setLanguageUserDefault(lang: "English")
                LanguageService.lang = true
            }
            setMuteSoundUserDefault(mute: false)
            setStreamStateUserDefault(play: true)
            setVolumeValueUserDefault(volume: 0.5)
            setIsRecordingUserDefault(state: false)
            if (audioRecorder.recordings == []) {
                setIsThereRecordUserDefault(exist: false)
            }
            else {
                setIsThereRecordUserDefault(exist: true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
