struct ForgotPasswordScreen: View {
    
    @EnvironmentObject var router: Router<AuthFlow>
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .padding()
            Button("Go to Login") {
                router.navigateBack()
            }
        }
        .padding()
        
    }
        
}