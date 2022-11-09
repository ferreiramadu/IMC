import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeigth: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculate(_ sender: Any) {
        if let Weigth = Double(tfWeigth.text!), let Heigth = Double(tfHeight.text!) {
            imc = Weigth / (Heigth * Heigth)
            //imc = Weigth / pow(Heigth, 2) poder ter essa função tambem
            
            showResults()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"

            case 16..<18.5:
                result = "Abaixo do peso"
                image = "ideal"
            
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        //setando as variaveis nos componentes
        lbResult.text = "\(String(format: "%.0f", imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false //mostra a div
        view.endEditing(true) //fecha o teclado
    }
    
}

