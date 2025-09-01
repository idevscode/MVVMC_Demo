struct MainScreen: View {
    
    @StateObject var router: Router<MainFlow> = Router<MainFlow>()
    
    var body: some View {
        
        NavigationStack(path: $router.navPath) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .padding()
                Button("Logout") {
                    
                }
            }
            .padding()
        }
        .navigationDestination(for: MainFlow.self) { destination in
            switch destination {
            case .profile: ProfileScreen()
            case .selectPartner: SelectPartnerScreen()
            }
        }
        
        
        
    }

}