//
//  CustomAlert.swift
//  plusFM
//
//  Created by Michael Hany on 21/12/2023.
//

import SwiftUI

struct CustomAlert: View {
    
    @Binding var show: Bool
    @State private var recordingTitle: String = ""
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("AppOrange"))
                .frame(width: 355, height: 205)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("AppWhite"))
                .frame(width: 350, height: 200)
            
            VStack{
                TextField("Untitled Recording", text: $recordingTitle)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).stroke(Color("AppOrange"), lineWidth: 1))
                    .padding(.horizontal, 50)
                    .padding(.bottom, 15)
                
                HStack{
                    //MARK: - Cancel Button
                    Button(action: {
                        audioRecorder.setRecordNameUserDefault(name: "")
                        audioRecorder.editFullName()
                        withAnimation{
                            show.toggle()
                        }
                    }) {
                        Text("Cancel")
                            .foregroundColor(Color("AppBlack"))
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .frame(width: 135)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("AppWhite"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color("AppGray"), lineWidth: 5)
                                            .blur(radius: 4)
                                            .offset(x: 2, y: 2)
                                            .mask(RoundedRectangle(cornerRadius: 30).fill(LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .leading, endPoint: .trailing)))
                                    )
                            )
                            .scaleEffect(1.0)
                    }
                    .padding(.leading, 50)
                    
                    Spacer()
                    
                    //MARK: - Save Button
                    Button(action: {
                        audioRecorder.setRecordNameUserDefault(name: "\(recordingTitle)")
                        audioRecorder.editFullName()
                        withAnimation{
                            show.toggle()
                        }
                    }) {
                        Text("Save")
                            .foregroundColor(Color("AppWhite"))
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .frame(width: 135)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("AppOrange"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color("AppOrange"), lineWidth: 5)
                                            .blur(radius: 4)
                                            .offset(x: 2, y: 2)
                                            .mask(RoundedRectangle(cornerRadius: 30).fill(LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                                    )
                            )
                            .scaleEffect(1.0)
                    }
                    .padding(.trailing, 50)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(show: .constant(false), audioRecorder: AudioRecorder())
    }
}
