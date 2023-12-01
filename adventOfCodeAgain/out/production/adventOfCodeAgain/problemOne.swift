import UIKit

var myArray = [String]()

var sum = 0
       let fileP = Bundle.main.path(forResource: "input", ofType: "txt")
       var myData = ""
       do {
           myData = try String(contentsOfFile: fileP!, encoding: String.Encoding.utf8)
       } catch let error as NSError {
           print(error)
       }
       
       //put txt input from string into array
       myArray = myData.components(separatedBy: .newlines)
      // print(h)
       
       sum = getSumOfAllCalibrations(stringArr: myArray)
       
       print("here \(sum)")
       



func getSumOfAllCalibrations(stringArr: [String]) -> Int {
   var sum = 0
   for strings in stringArr {
       let trimmedString = strings.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted).trimmingCharacters(in: .whitespaces)
       let combinedNums = "\(trimmedString.first ?? "0")\(trimmedString.last ?? "0")"
       sum += (combinedNums as NSString).integerValue
       
   }
   return sum
}

extension String {
//    get file name from string
    func fileName() -> String {
        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }
    
//    get file extension
    func fileExtension() -> String {
        return URL(fileURLWithPath: self).pathExtension
    }
}

func readFile(inputfile : String) -> String {
//    split file extension and file name
    let fileExtension = inputfile.fileExtension()
    let fileName = inputfile.fileName()
    
//    get file url
    let fileURL = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    let inputFile = fileURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    
//    get the data
    do{
        let savedData = try String(contentsOf: inputFile)
        return savedData
    } catch {
        return error.localizedDescription
    }
}


