import SwiftUI

public enum AlimoImage {
    case Parent
    case ParentDisabled
    case Student
    case StudentDisabled
    case Teacher
    case TeacherDisabled
    
    var image: String {
        switch self {
        case .Parent: "Parent"
        case .ParentDisabled: "ParentDisabled"
        case .Student: "Student"
        case .StudentDisabled: "StudentDisabled"
        case .Teacher: "Teacher"
        case .TeacherDisabled: "TeacherDisabled"
        }
    }
}
