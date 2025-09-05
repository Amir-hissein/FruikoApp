import SwiftUI

@available(iOS 17.0, *)
struct TextFieldPhoneNumber: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    @State private var showModel: Bool = false
    @State private var selectedCountry: Country = Country.list.first!
    @State private var dialCode: String = Country.list.first!.dialCode
    @State private var PhoneNumber: String = ""
    
    var body: some View {
        inputField
            .sheet(isPresented: $showModel) {
                CountrySelectionSheet(selectedCountry: $selectedCountry, dialCode: $dialCode)
            }
            .onChange(of: selectedCountry) {
                updatePhoneNumber()
            }
            .onChange(of: dialCode){
                updatePhoneNumber()
            }
            .onAppear{
                updatePhoneNumber()
            }
    }
    
    private var inputField: some View {
        HStack {
            Button {
                self.showModel.toggle()
            } label: {
                Text("\(selectedCountry.flag) (\(dialCode))")
                    .foregroundColor(Color(.label))
                    .padding(.leading, 8)
                Image(systemName: "chevron.down")
                    .foregroundColor(Color.gray)
            }
            
            TextField("Phone Number", text: $PhoneNumber)
                .keyboardType(.phonePad)
                .focused($isFocused)
                .padding(8)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(isFocused ? Color.blue : Color.gray, lineWidth: 1)
        }
        .padding()
    }
    
    
    private func updatePhoneNumber() {
        text = "\(dialCode)\(PhoneNumber)"
    }
}



// ✅ Preview qui fonctionne même avant iOS 17
#Preview {
    StatefulPreviewWrapper("") { text in
        if #available(iOS 17.0, *) {
            TextFieldPhoneNumber(text: text)
                .padding()
        } else {
            // Fallback on earlier versions
        }
           
    }
}
