import UIKit


class Vagon{
    var next: Vagon?
    var value: Int
    
    init(next: Vagon?, valor: Int){
        self.next = next
        self.value = valor
    }
}

func inserNewVagon(tren: Vagon?, newVagon: Vagon) -> Vagon {
    print("ver trenes",tren?.value as Any )
    var trenComplete: Vagon?
    guard var tren = tren else {
        var newTren = Vagon(next: tren, valor: newVagon.value)
        return newTren
    }
    
    if tren.value < newVagon.value {
        if tren.next != nil {
            trenComplete = tren
            trenComplete?.next = inserNewVagon(tren: tren.next, newVagon: newVagon)
            return trenComplete!
        } else {
            tren.next = newVagon
            return tren
        }
    } else {
        //insertar
        newVagon.next = tren
        return newVagon
    }
}


var tren = Vagon(next: Vagon(next: Vagon(next: Vagon(next: nil, valor: 5), valor: 3), valor: 2), valor: 1)
 tren = inserNewVagon(tren: tren, newVagon: Vagon(next: nil, valor: 4))


//Jugar con el valor que desea optener
print(tren.next?.next?.next?.next?.value)

