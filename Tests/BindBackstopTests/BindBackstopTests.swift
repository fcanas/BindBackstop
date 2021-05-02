    import XCTest
    import SwiftUI
    @testable import BindBackstop

    final class BindBackstopTests: XCTestCase {
        func testInitializerBinding() {
            let nilStringBinding = Binding<String?>.constant(nil)
            let nonOptionalBinding = Binding<String>(nilStringBinding, "-")
            
            XCTAssertEqual(nonOptionalBinding.wrappedValue, "-")
            XCTAssertNil(nilStringBinding.wrappedValue)
        }
        
        func testFluentStyle() {
            let nonOptionalBinding = Binding<String?>.constant(nil).with(default: "~")
            XCTAssertEqual(nonOptionalBinding.wrappedValue, "~")
        }
        
        func testMutatingBinding() {
            
            struct AView: View {
                @Binding var value: Int
                var body: some View { Color.black }
                func reportValue() -> Int { value }
                func setValue(new: Int) { value = new }
            }
            
            var value: Int? = nil
            let valueBinding = Binding<Int?>(get: { value }, set: { value = $0 })
            
            let aView = AView(value: valueBinding.with(default: 0))
            
            // Start with nil
            XCTAssertEqual(aView.reportValue(), 0)
            
            // Set value via binding
            aView.setValue(new: 12)
            XCTAssertEqual(aView.reportValue(), 12)
            XCTAssertEqual(value, 12)
            
            // Set value via backing variable
            value = 1
            XCTAssertEqual(aView.reportValue(), 1)
            XCTAssertEqual(value, 1)
            
            // back to nil
            value = nil
            XCTAssertEqual(aView.reportValue(), 0)
            XCTAssertNil(value)
        }
    }
