// Notes about miscellaneous stuff

import UIKit

// Conditional
var foo = 1
var bar = 2

if foo == 1 {
    print("wew")
}

// Function
func canPurchase(amount: Double) -> Bool {
    if amount > 0 {
        return true
    }

    return false
}

canPurchase(-51.0)


