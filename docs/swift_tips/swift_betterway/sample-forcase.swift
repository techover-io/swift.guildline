import Foundation

class Student {
    let name: String
    let age: Int
    
    init(_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
}

struct Class {
    let name: String
    let code: String
}

struct University {
    let name: String
    let price: Double
}

var listObject = [Any]()

for index in 1...2000 {
    if (index % 3 == 0) {
        let university = University(name: "University", price: Double(10_000 * index))
        listObject.append(university)
    } else if (index % 2 == 0) {
        let classInstance = Class(name: "Class", code: "Class \(index)")
        listObject.append(classInstance)
    } else {
        let student = Student("nhathm-class", 12)
        listObject.append(student)
    }
}

print(listObject.count)

var start = CACurrentMediaTime()

var stringTemp = ""
// Instead of:
for element in listObject {
    if let element = element as? University {
        // do something
        stringTemp = element.name
    }
}

let diff1 = CACurrentMediaTime() - start
print("Diff 1 = \(diff1)")

start = CACurrentMediaTime()

// Do:
for case let element as University in listObject {
    // do something
    stringTemp = element.name
}

let diff2 = CACurrentMediaTime() - start
print("Diff 2 = \(diff2)")
print("Ratio: \(diff1/diff2)")
