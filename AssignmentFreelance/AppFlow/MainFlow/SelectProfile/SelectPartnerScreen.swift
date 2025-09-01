struct SelectPartnerScreen: View {
    
    @EnvironmentObject var router: Router<MainFlow>
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .padding()
            
        }
        .padding()
    }

}