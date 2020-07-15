//
//  InfoLogo.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI

struct InfoLogo: View {
    
    var logo: Image
    var infoText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Dark Grey"))
                .frame(width: 40, height: 40)
                .cornerRadius(5)
                
            VStack(alignment: .center) {
                logo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                    .clipped()
                    .padding(.bottom, -5)
                Text(infoText)
                    .font(.system(size: 8))
                    .foregroundColor(.white)
            }
        }
    }
}

struct InfoLogo_Previews: PreviewProvider {
    static var previews: some View {
        InfoLogo(logo: Image("timer"), infoText: "2 days")
    }
}
