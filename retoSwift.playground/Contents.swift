import UIKit
import Foundation

extension String{
    func capitalizingFirstLetter() -> String {
       return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
       self = self.capitalizingFirstLetter()
    }
}

extension Date {
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

struct Person{
    var name: String
    var lastName: String
    var lastSecondName: String
    var birthDate: Date
    var dni: String
    var sex: String
    var email: String
    var numberBrothers: Int
    var age: Int {
        let components = birthDate.get(.day, .month, .year)
        let myDOB = Calendar.current.date(from: DateComponents(year: components.year, month:  components.month, day: components.day))!

        return myDOB.age
    }
    var username: String?{
        let userArr = email.components(separatedBy: "@")
        return userArr[0]
    }
    
    var moreTwoBothers: Bool {
        numberBrothers > 2
    }
    
    var completeName: String {
        "\(name.capitalizingFirstLetter()) \(lastName.capitalizingFirstLetter()) \(lastSecondName.capitalized.first!).  - \(age) años"
    }
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yyyy"

let personsList = [
    Person(name: "CARLOS JOSÉ", lastName: "ROBLES", lastSecondName: "GOMES", birthDate: dateFormatter.date(from: "06/08/1995")!, dni: "78451245", sex: "male", email: "carlos.roblesg@hotmail.com", numberBrothers: 2),
    Person(name: "MIGUEL ANGEL", lastName: "QUISPE", lastSecondName: "OTERO", birthDate: dateFormatter.date(from: "28/12/1995")!, dni: "79451654", sex: "male", email: "miguel.anguel@gmail.com", numberBrothers: 0),
    Person(name: "KARLA ALEXANDRA", lastName: "FLORES", lastSecondName: "ROSAS", birthDate: dateFormatter.date(from: "15/02/1997")!, dni: "77485812", sex: "female", email: "Karla.alexandra@hotmail.com", numberBrothers: 1),
    Person(name: "NICOLAS", lastName: "QUISPE", lastSecondName: "ZEBALLOS", birthDate: dateFormatter.date(from: "08/10/1990")!, dni: "71748552", sex: "male", email: "nicolas123@gmail.com", numberBrothers: 1),
    Person(name: "PEDRO ANDRE", lastName: "PICASSO", lastSecondName: "BETANCUR", birthDate: dateFormatter.date(from: "17/05/1994")!, dni: "74823157", sex: "male", email: "pedroandrepicasso@gmail.com", numberBrothers: 2),
    Person(name: "FABIOLA MARIA", lastName: "PALACIO", lastSecondName: "VEGA", birthDate: dateFormatter.date(from: "02/02/1992")!, dni: "76758254", sex: "female", email: "fabi@hotmail.com", numberBrothers: 0)
]


let listaPersonas: [Person] = personsList


print("\nImprimir personas: ")
listaPersonas.forEach{ person in
    print(person.completeName)
}

var onlyMaleList: [Person] = []
var onlyFemaleList: [Person] = []

listaPersonas.forEach{person in
    if(person.sex == "male"){
        onlyMaleList.append(person)
    }
    else{
        onlyFemaleList.append(person)
    }
}
print("\nLista total Hombres: \(onlyMaleList.count)")

print("\nLista total Mujeres: \(onlyFemaleList.count)")


var moreTwoBroList: [Person] = []
listaPersonas.forEach{person in
    if(person.moreTwoBothers == true){
        moreTwoBroList.append(person)
    }
}

if(moreTwoBroList.count > 0){
    moreTwoBroList.forEach{ person in
        print(person.completeName)
    }
}
else{
    print("\nNo hay personas con más de 2 hermanos.")
}




