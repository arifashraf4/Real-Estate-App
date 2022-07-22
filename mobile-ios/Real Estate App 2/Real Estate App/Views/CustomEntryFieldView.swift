//
//  CustomEntryFieldView.swift
//  Real Estate App
//
//  Created by arifashraf on 16/12/21.
//
import SwiftUI

struct EntryField: View {
    var sfSymbolName: String
    var placeHolder: String
    var prompt: String
    @Binding var field: String
    var isSecure:Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: sfSymbolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                if isSecure {
                    SecureField(placeHolder, text: $field).autocapitalization(.none)
                } else {
                    TextField(placeHolder, text: $field).autocapitalization(.none)
                }
            }
            .padding()
            .background(Color(UIColor.white))
            .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.gray, lineWidth: 1))
            Text(prompt)
                .foregroundColor(.red)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
        .padding()
    }
}
