@propertyWrapper
struct EmailWrapper {
    var wrappedValue: String
    private var value : String = ""
    
    init(wrappedValue: String) {
        self.value = wrappedValue
    }
    
    var projectedValue: Bool {
        return Self.isValid(value)
    }
    
    private static func isValid(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
    
    
}