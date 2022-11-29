//
//  DropdownView.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 29.11.22.
//

import SwiftUI

struct DropdownView: View {
    
    @State private var isOpen = false
    
    let title: String
    let items: [String]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .center) {
                
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Button {
                    isOpen.toggle()
                } label: {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isOpen ? 90 : 0))
                }
            }
            .padding(.bottom, isOpen ? nil : 0)
            
            if isOpen {
                
                ForEach(items, id: \.self) { item in
                    HStack {
                        Image(systemName: "circlebadge.fill")
                        Text(item)
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: .lightGray))
        )
        .animation(.default, value: isOpen)
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView(title: "Food pairing", items: ["Roggen", "Gerste", "Wasser"])
            .padding()
    }
}
