//
//  NewOnboardingSecondView.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import SwiftUI

struct NewOnboardingSecondView: View {
    
    @StateObject var viewModel: OnboardingSecondViewModel
    
    let gradientColors = Gradient(colors: [Color(R.color.green_Light()!), Color(R.color.green_Global()!)])
    
    var gradientBackground: LinearGradient {
        LinearGradient(gradient: gradientColors,
                       startPoint: .leading,
                       endPoint: .trailing)
    }
    
    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer()
                
                Image(R.image.logoImageOnbording2.name)
                
                Spacer()
                
                Text(R.string.localization.onboardingSecondTitle())
                    .font(.system(size: 22, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                Text(R.string.localization.onboardingSecondSubtitle())
                    .font(.system(size: 12, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 42)

                Button(action: {viewModel.nextEvent.send(()) }) {
                    Text(R.string.localization.onboardingSecondNextButton())
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 175, height: 57)
                        .background(gradientBackground)
                        .cornerRadius(15)
                }
                .padding(.bottom, 30)
            }
        }
    }
}
