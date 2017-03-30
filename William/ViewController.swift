//
//  ViewController.swift
//  William
//
//  Created by Per Lindgren on 2017-02-23.
//  Copyright © 2017 Elith Apps. All rights reserved.
//

import UIKit

enum direction {
    case SWEtoUSA
    case USAtoSWE
}

enum tempSWE {
    case plusC
    case minusC
}

enum distanceSWE {
    case cm
    case m
    case km
}

enum volumeSWE {
    case ml
    case dl
    case l
}

enum weightSWE {
    case g
    case kg
    case tons
}

enum distanceUSA {
    case inches
    case feet
    case miles
}

enum volumeUSA {
    case gallons
    case quartz
    case cups
}

enum weightUSA {
    case lbp
    case oz
    case usTons
}

class ViewController: UIViewController {
    @IBOutlet weak var tempImage: UIImageView!
    @IBOutlet weak var distanceImage: UIImageView!
    @IBOutlet weak var volumeImage: UIImageView!
    @IBOutlet weak var weightImage: UIImageView!
    
    @IBOutlet weak var resultView: UIView!    
    
    @IBOutlet weak var switchLabel: UIButton!
    
    @IBOutlet weak var weightLabel: UIButton!
    @IBOutlet weak var volumeLabel: UIButton!
    @IBOutlet weak var distanceLabel: UIButton!
    @IBOutlet weak var tempLabel: UIButton!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var tempLabel1: UILabel!
    @IBOutlet weak var tempSublabel1: UILabel!
    @IBOutlet weak var tempLabel2: UILabel!
    @IBOutlet weak var tempSublabel2: UILabel!
    @IBOutlet weak var distanceLabel1: UILabel!
    @IBOutlet weak var distanceSublabel1: UILabel!
    @IBOutlet weak var distanceLabel2: UILabel!
    @IBOutlet weak var distanceSublabel2: UILabel!
    @IBOutlet weak var distanceLabel3: UILabel!
    @IBOutlet weak var distanceSublabel3: UILabel!
    @IBOutlet weak var volumeLabel1: UILabel!
    @IBOutlet weak var volumeSublabel1: UILabel!
    @IBOutlet weak var volumeLabel2: UILabel!
    @IBOutlet weak var volumeSublabel2: UILabel!
    @IBOutlet weak var volumeLabel3: UILabel!
    @IBOutlet weak var volumeSublabel3: UILabel!
    @IBOutlet weak var weightLabel1: UILabel!
    @IBOutlet weak var weightSublabel1: UILabel!
    @IBOutlet weak var weightLabel2: UILabel!
    @IBOutlet weak var weightSublabel2: UILabel!
    @IBOutlet weak var weightLabel3: UILabel!
    @IBOutlet weak var weightSublabel3: UILabel!
    
    var labelString:String = "0"
    var currentNumbers:Float = 0
    var currentDirection:direction = .SWEtoUSA
    var currentTempSWE:tempSWE = .plusC
    var currentDistanceSWE:distanceSWE = .cm
    var currentVolumeSWE:volumeSWE = .dl
    var currentWeightSWE:weightSWE = .kg
    var currentDistanceUSA:distanceUSA = .feet
    var currentVolumeUSA:volumeUSA = .cups
    var currentWeightUSA:weightUSA = .lbp
    var havingFraction:Bool = false
    
    var resultViewColorUSA:UIColor = UIColor(red: 0/255, green: 22/255, blue: 52/255, alpha: 1)
    var resultViewColorMETRIC:UIColor = UIColor(red: 52/255, green: 6/255, blue: 15/255, alpha: 1)
    var switchButtonColorUSA:UIColor = UIColor(red: 0/255, green: 46/255, blue: 104/255, alpha: 1)
    var switchButtonColorMETRIC:UIColor = UIColor(red: 103/255, green: 15/255, blue: 31/255, alpha: 1)
    var tintColorUSA:UIColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    var tintColorMETRIC:UIColor = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /********** ADJUSTING KERNING
        let attributedString = NSMutableAttributedString(string: "384")
        attributedString.addAttribute(NSKernAttributeName, value: CGFloat(-4.0), range: NSRange(location: 0, length: 3))
        mainLabel.attributedText = attributedString
        ***********/
        
        
        
        
        updateText()
        
        

    }
    
    
    func updateTemp() {
        if (currentDirection == .SWEtoUSA) {
            tempSublabel1.text = "°F"
            
            if (currentTempSWE == .plusC) {
                
                tempLabel.setTitle("+ °C", for: .normal)
                
            } else {
                
                tempLabel.setTitle("— °C", for: .normal)
            }
        } else {
            tempSublabel1.text = "°C"
            tempLabel.setTitle("°F", for: .normal)
        }

    }

    func updateDistance() {
        if (currentDirection == .SWEtoUSA) {
            if (currentDistanceSWE == .m) {
                distanceLabel.setTitle("m", for: .normal)
                distanceSublabel1.text = "inches"
                distanceSublabel2.text = "feet"
                distanceSublabel3.text = "yards"
            } else if (currentDistanceSWE == .km) {
                distanceLabel.setTitle("km", for: .normal)
                distanceSublabel1.text = "yards"
                distanceSublabel2.text = "miles"
                distanceSublabel3.text = "naut. miles"
            } else if (currentDistanceSWE == .cm) {
                distanceLabel.setTitle("cm", for: .normal)
                distanceSublabel1.text = "inches"
                distanceSublabel2.text = "feet"
                distanceSublabel3.text = "yards"
            }
        } else {
            if (currentDistanceUSA == .feet) {
                distanceLabel.setTitle("feet", for: .normal)
                distanceSublabel1.text = "cm"
                distanceSublabel2.text = "meter"
                distanceSublabel3.text = "km"
                
            } else if (currentDistanceUSA == .miles) {
                distanceLabel.setTitle("miles", for: .normal)
                distanceSublabel1.text = "cm"
                distanceSublabel2.text = "meter"
                distanceSublabel3.text = "km"
                
            } else if (currentDistanceUSA == .inches) {
                distanceLabel.setTitle("inches", for: .normal)
                distanceSublabel1.text = "cm"
                distanceSublabel2.text = "meter"
                distanceSublabel3.text = "km"
                
            }
        }

    }
    
    func updateVolume() {
        if (currentDirection == .SWEtoUSA) {
            if (currentVolumeSWE == .dl) {
                volumeLabel.setTitle("dl", for: .normal)
                volumeSublabel1.text = "fl. oz"
                volumeSublabel2.text = "cups"
                volumeSublabel3.text = "quarts"
            } else if (currentVolumeSWE == .l) {
                volumeLabel.setTitle("liters", for: .normal)
                volumeSublabel1.text = "cups"
                volumeSublabel2.text = "quarts"
                volumeSublabel3.text = "gallons"
            } else if (currentVolumeSWE == .ml) {
                volumeLabel.setTitle("ml", for: .normal)
                volumeSublabel1.text = "fl. oz"
                volumeSublabel2.text = "cups"
                volumeSublabel3.text = "quarts"
            }
        } else {
            if (currentVolumeUSA == .quartz) {
                volumeLabel.setTitle("quarts", for: .normal)
                volumeSublabel1.text = "ml"
                volumeSublabel2.text = "dl"
                volumeSublabel3.text = "liter"
                
            } else if (currentVolumeUSA == .gallons) {
                volumeLabel.setTitle("gallons", for: .normal)
                volumeSublabel1.text = "ml"
                volumeSublabel2.text = "dl"
                volumeSublabel3.text = "liter"
                
            } else if (currentVolumeUSA == .cups) {
                volumeLabel.setTitle("cups", for: .normal)
                volumeSublabel1.text = "ml"
                volumeSublabel2.text = "dl"
                volumeSublabel3.text = "liter"
                
            }
        }

    }
    
    func updateWeight() {
        if (currentDirection == .SWEtoUSA) {
            if (currentWeightSWE == .kg) {
                weightLabel.setTitle("kg", for: .normal)
                weightSublabel1.text = "oz"
                weightSublabel2.text = "lb"
                weightSublabel3.text = "US tons"
            } else if (currentWeightSWE == .tons) {
                weightLabel.setTitle("tons", for: .normal)
                weightSublabel1.text = "oz"
                weightSublabel2.text = "lb"
                weightSublabel3.text = "US tons"
            } else if (currentWeightSWE == .g) {
                weightLabel.setTitle("g", for: .normal)
                weightSublabel1.text = "oz"
                weightSublabel2.text = "lb"
                weightSublabel3.text = "US tons"
            }
        } else {
            if (currentWeightUSA == .lbp) {
                weightLabel.setTitle("lb", for: .normal)
                weightSublabel1.text = "g"
                weightSublabel2.text = "kg"
                weightSublabel3.text = "tons"
                
            } else if (currentWeightUSA == .usTons) {
                weightLabel.setTitle("US tons", for: .normal)
                weightSublabel1.text = "g"
                weightSublabel2.text = "kg"
                weightSublabel3.text = "tons"
                
            } else if (currentWeightUSA == .oz) {
                weightLabel.setTitle("oz", for: .normal)
                weightSublabel1.text = "g"
                weightSublabel2.text = "kg"
                weightSublabel3.text = "tons"
                
            }
        }
        
    }
    
    func updateText() {
        
        guard let labelFloat:Float = Float(labelString) else {
            return
        }
        
        currentNumbers = labelFloat
        
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        var numx:NSNumber = NSNumber(value: labelFloat)
        
        if (havingFraction) {
            mainLabel.text = formatter.string(from: numx)
            mainLabel.text = mainLabel.text?.appending(".")
            havingFraction = false
        } else {
            mainLabel.text = formatter.string(from: numx)
        }
        
        

        
        formatter.maximumFractionDigits = 1
        
        // --- Calculate Temperatures
        
        var temp1:Float = 0
        var temp2:Float = 0
        var distance1:Float = 0
        var distance2:Float = 0
        var distance3:Float = 0
        var volume1:Float = 0
        var volume2:Float = 0
        var volume3:Float = 0
        var weight1:Float = 0
        var weight2:Float = 0
        var weight3:Float = 0
        
        // ******** Swedish format translated to USA format
        if (currentDirection == .SWEtoUSA) {
            
            // Temperature
            if (currentTempSWE == .plusC) {
                temp1 = labelFloat * 1.8 + 32 // Celcius to Fahrenheit
                temp2 = labelFloat + 273.15 // Celcius to Kelvin
            } else {
                temp1 = -labelFloat * 1.8 + 32 // Celcius to Fahrenheit
                temp2 = -labelFloat + 273.15 // Celcius to Kelvin
            }
            
            // Distance
            if (currentDistanceSWE == .cm) {
                distance1 = labelFloat / 2.54 // cm to inches
                distance2 = labelFloat / 30.48 // cm to feet
                distance3 = labelFloat / 91.44 // cm to yards
            } else if (currentDistanceSWE == .m) {
                distance1 = labelFloat * 39.37 // m to inches
                distance2 = labelFloat * 3.28 // m to feet
                distance3 = labelFloat * 1.0936 // m to yards
                
            } else if (currentDistanceSWE == .km) {
                distance1 = labelFloat * 1093.61 // km to yards
                distance2 = labelFloat * 0.621371 // km to miles
                distance3 = labelFloat * 0.53996 // km to nautical miles
                
            }
            
            // Volume
            if (currentVolumeSWE == .ml) {
                volume1 = labelFloat * 0.033333333333333 // ml to fluid oz
                volume2 = labelFloat * 0.0042267528 // ml to cups
                volume3 = labelFloat * 0.001056688209 // ml to quarts
                
            } else if (currentVolumeSWE == .dl) {
                volume1 = labelFloat * 3.3333333333333 // dl to fluid oz
                volume2 = labelFloat * 0.422675281986 // dl to cups
                volume3 = labelFloat * 0.105668820943 // dl to quarts
                
            } else if (currentVolumeSWE == .l) {
                volume1 = labelFloat * 4.226753 // liters to cups
                volume2 = labelFloat * 1.056688 // liters to quarts
                volume3 = labelFloat * 0.2641720 // liters to gallons
                
            }
            
            // Weight
            if (currentWeightSWE == .g) {
                weight1 = labelFloat * 0.035274 // g to oz
                weight2 = labelFloat * 0.00220462262 // g to lb
                weight3 = labelFloat * 0.000001102311 // g to US tons
                
            } else if (currentWeightSWE == .kg) {
                weight1 = labelFloat * 35.27396195 // kg to oz
                weight2 = labelFloat * 2.204623 // kg to lb
                weight3 = labelFloat * 0.001102311 // kg to US tons
                
            } else if (currentWeightSWE == .tons) {
                weight1 = labelFloat * 35273.96 // tons to oz
                weight2 = labelFloat * 2204.623 // tons to lb
                weight3 = labelFloat * 1.102311 // tons to US tons
                
            }
            
        } else { // ******** USA format translated to SWE format
            
            // Temperature
            temp1 = (labelFloat - 32) * 5 / 9 // Fahrenheit to Celsius
            temp2 = (labelFloat + 459.67) * 5 / 9 // Fahrenheit to Kelvins
            
            // Distance
            if (currentDistanceUSA == .inches) {
                distance1 = labelFloat * 2.54 // inches to cm
                distance2 = labelFloat * 0.0254 // inches to m
                distance3 = labelFloat * 0.0000254 // inches to km
                
            } else if (currentDistanceUSA == .feet) {
                distance1 = labelFloat * 30.48 // feet to cm
                distance2 = labelFloat * 0.3048 // feet to m
                distance3 = labelFloat * 0.0003048 // feet to km
                
            } else if (currentDistanceUSA == .miles) {
                distance1 = labelFloat * 160934.4 // miles to cm
                distance2 = labelFloat * 1609.344 // miles to m
                distance3 = labelFloat * 1.609344 // miles to km
                
            }
            
            // Volume
            if (currentVolumeUSA == .cups) {
                volume1 = labelFloat * 236.5882 // cups to ml
                volume2 = labelFloat * 2.365882375 // cups to dl
                volume3 = labelFloat * 0.2365882 // cups to liters
                
            } else if (currentVolumeUSA == .quartz) {
                volume1 = labelFloat * 946.3530 // quarts to ml
                volume2 = labelFloat * 9.46352946 // quarts to dl
                volume3 = labelFloat * 0.9463530 // quarts to liters
                
            } else if (currentVolumeUSA == .gallons) {
                volume1 = labelFloat * 3785.412 // gallons to ml
                volume2 = labelFloat * 37.854118 // gallons to dl
                volume3 = labelFloat * 3.78541 // gallons to liters
                
            }
            
            // Weight
            if (currentWeightUSA == .oz) {
                weight1 = labelFloat * 28.34952 // oz to g
                weight2 = labelFloat * 0.02834952 // oz to kg
                weight3 = labelFloat * 0.00002834952 // oz to tons
                
            } else if (currentWeightUSA == .lbp) {
                weight1 = labelFloat * 453.5923 // lb to g
                weight2 = labelFloat * 0.4535923 // lb to kg
                weight3 = labelFloat * 0.0004535923 // lb to tons
                
            } else if (currentWeightUSA == .usTons) {
                weight1 = labelFloat * 907184.7 // ustons to g
                weight2 = labelFloat * 907.1847 // ustons to kg
                weight3 = labelFloat * 0.9071847 // ustons to tons
                
            }
            
        }
        // Update Temperature Labels
        numx = NSNumber(value: temp1)
        tempLabel1.text = formatter.string(from: numx)
        numx = NSNumber(value: temp2)
        tempLabel2.text = formatter.string(from: numx)
        
        // Update Distance Labels
        numx = NSNumber(value: distance1)
        distanceLabel1.text = formatter.string(from: numx)
        numx = NSNumber(value: distance2)
        distanceLabel2.text = formatter.string(from: numx)
        numx = NSNumber(value: distance3)
        distanceLabel3.text = formatter.string(from: numx)
        
        // Update Volume Labels
        numx = NSNumber(value: volume1)
        volumeLabel1.text = formatter.string(from: numx)
        numx = NSNumber(value: volume2)
        volumeLabel2.text = formatter.string(from: numx)
        numx = NSNumber(value: volume3)
        volumeLabel3.text = formatter.string(from: numx)

        // Update Weight Labels
        numx = NSNumber(value: weight1)
        weightLabel1.text = formatter.string(from: numx)
        numx = NSNumber(value: weight2)
        weightLabel2.text = formatter.string(from: numx)
        numx = NSNumber(value: weight3)
        weightLabel3.text = formatter.string(from: numx)

        
    }
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        let stringValue:String? = sender.titleLabel?.text
        
        // Check if there is a dot yet
        if (stringValue == ".") {
            if (labelString.range(of:".") != nil) {
                return
            } else {
                havingFraction = true
            }
            
        }
        labelString = labelString.appending(stringValue!)
        
        updateText()
        
    }

    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        updateText()
        
    }
    @IBAction func didPressSwitch(_ sender: Any) {
        if (currentDirection == .SWEtoUSA) {
            currentDirection = .USAtoSWE
//            switchLabel.setTitle("USA to METRIC", for: .normal)
            
            // CHANGE UI COLORS
            switchLabel.setImage(#imageLiteral(resourceName: "Switch2"), for: .normal)
            tempImage.image = #imageLiteral(resourceName: "Temp2")
            distanceImage.image = #imageLiteral(resourceName: "Ruler2")
            volumeImage.image = #imageLiteral(resourceName: "Drop2")
            weightImage.image = #imageLiteral(resourceName: "Weight2")
            resultView.backgroundColor = resultViewColorMETRIC
            tempLabel.backgroundColor = switchButtonColorUSA
            distanceLabel.backgroundColor = switchButtonColorUSA
            volumeLabel.backgroundColor = switchButtonColorUSA
            weightLabel.backgroundColor = switchButtonColorUSA
            tempSublabel1.textColor = tintColorMETRIC
            tempSublabel2.textColor = tintColorMETRIC
            distanceSublabel1.textColor = tintColorMETRIC
            distanceSublabel2.textColor = tintColorMETRIC
            distanceSublabel3.textColor = tintColorMETRIC
            volumeSublabel1.textColor = tintColorMETRIC
            volumeSublabel2.textColor = tintColorMETRIC
            volumeSublabel3.textColor = tintColorMETRIC
            weightSublabel1.textColor = tintColorMETRIC
            weightSublabel2.textColor = tintColorMETRIC
            weightSublabel3.textColor = tintColorMETRIC
            
            
            tempLabel.setTitle("°F", for: .normal)
            
            if (currentDistanceUSA == .inches) {
                distanceLabel.setTitle("inches", for: .normal)
            } else if (currentDistanceUSA == .feet) {
                distanceLabel.setTitle("feet", for: .normal)
            } else {
                distanceLabel.setTitle("miles", for: .normal)
            }
            
            if (currentVolumeUSA == .quartz) {
                volumeLabel.setTitle("quarts", for: .normal)
            } else if (currentVolumeUSA == .cups) {
                volumeLabel.setTitle("cups", for: .normal)
            } else {
                volumeLabel.setTitle("gallons", for: .normal)
            }
            
            if (currentWeightUSA == .oz) {
                weightLabel.setTitle("oz", for: .normal)
            } else if (currentWeightUSA == .lbp) {
                weightLabel.setTitle("lb", for: .normal)
            } else {
                weightLabel.setTitle("US tons", for: .normal)
            }
            
            
        } else {
            currentDirection = .SWEtoUSA
//            switchLabel.setTitle("METRIC to USA", for: .normal)
            // CHANGE UI COLORS
            switchLabel.setImage(#imageLiteral(resourceName: "Switch1"), for: .normal)
            tempImage.image = #imageLiteral(resourceName: "Temp1")
            distanceImage.image = #imageLiteral(resourceName: "Ruler1")
            volumeImage.image = #imageLiteral(resourceName: "Drop1")
            weightImage.image = #imageLiteral(resourceName: "Weight1")
            resultView.backgroundColor = resultViewColorUSA
            tempLabel.backgroundColor = switchButtonColorMETRIC
            distanceLabel.backgroundColor = switchButtonColorMETRIC
            volumeLabel.backgroundColor = switchButtonColorMETRIC
            weightLabel.backgroundColor = switchButtonColorMETRIC
            tempSublabel1.textColor = tintColorUSA
            tempSublabel2.textColor = tintColorUSA
            distanceSublabel1.textColor = tintColorUSA
            distanceSublabel2.textColor = tintColorUSA
            distanceSublabel3.textColor = tintColorUSA
            volumeSublabel1.textColor = tintColorUSA
            volumeSublabel2.textColor = tintColorUSA
            volumeSublabel3.textColor = tintColorUSA
            weightSublabel1.textColor = tintColorUSA
            weightSublabel2.textColor = tintColorUSA
            weightSublabel3.textColor = tintColorUSA
            
            if (currentTempSWE == .plusC) {
                tempLabel.setTitle("+ °C", for: .normal)
            } else {
                tempLabel.setTitle("— °C", for: .normal)
            }
            
            if (currentDistanceSWE == .cm) {
                distanceLabel.setTitle("cm", for: .normal)
            } else if (currentDistanceSWE == .m) {
                distanceLabel.setTitle("meter", for: .normal)
            } else {
                distanceLabel.setTitle("km", for: .normal)
            }
            
            if (currentVolumeSWE == .ml) {
                volumeLabel.setTitle("ml", for: .normal)
            } else if (currentVolumeSWE == .dl) {
                volumeLabel.setTitle("dl", for: .normal)
            } else {
                volumeLabel.setTitle("liters", for: .normal)
            }
            
            if (currentWeightSWE == .g) {
                weightLabel.setTitle("g", for: .normal)
            } else if (currentWeightSWE == .kg) {
                weightLabel.setTitle("kg", for: .normal)
            } else {
                weightLabel.setTitle("tons", for: .normal)
            }
            
        }
        
        
        updateTemp()
        updateWeight()
        updateVolume()
        updateDistance()
        
        updateText()
        
        
        
    }
    @IBAction func didPressTemp(_ sender: Any) {
        if (currentDirection == .SWEtoUSA) {
            if (currentTempSWE == .plusC) {
                currentTempSWE = .minusC
            } else {
                currentTempSWE = .plusC
            }
            
        }
        
        updateTemp()
        updateText()
        
        
    }
    @IBAction func didPressDistance(_ sender: Any) {
        
        // Toggling
        if (currentDirection == .SWEtoUSA) {
            if (currentDistanceSWE == .cm) {
                currentDistanceSWE = .m
            } else if (currentDistanceSWE == .m) {
                currentDistanceSWE = .km
            } else if (currentDistanceSWE == .km) {
                currentDistanceSWE = .cm
            }
        } else {
            if (currentDistanceUSA == .inches) {
                currentDistanceUSA = .feet
                
            } else if (currentDistanceUSA == .feet) {
                currentDistanceUSA = .miles
                
            } else if (currentDistanceUSA == .miles) {
                currentDistanceUSA = .inches
                
            }
        }

        
        updateDistance()
        updateText()
        

    }
    @IBAction func didPressVolume(_ sender: Any) {
        
        if (currentDirection == .SWEtoUSA) {
            if (currentVolumeSWE == .ml) {
                currentVolumeSWE = .dl
            } else if (currentVolumeSWE == .dl) {
                currentVolumeSWE = .l
            } else if (currentVolumeSWE == .l) {
                currentVolumeSWE = .ml
            }
        } else {
            if (currentVolumeUSA == .cups) {
                currentVolumeUSA = .quartz
                
            } else if (currentVolumeUSA == .quartz) {
                currentVolumeUSA = .gallons
                
            } else if (currentVolumeUSA == .gallons) {
                currentVolumeUSA = .cups
                
            }
        }

        updateVolume()
        updateText()

    }
    @IBAction func didPressWeight(_ sender: Any) {
        
        if (currentDirection == .SWEtoUSA) {
            if (currentWeightSWE == .g) {
                currentWeightSWE = .kg
            } else if (currentWeightSWE == .kg) {
                currentWeightSWE = .tons
            } else if (currentWeightSWE == .tons) {
                currentWeightSWE = .g
            }
        } else {
            if (currentWeightUSA == .oz) {
                currentWeightUSA = .lbp
                
            } else if (currentWeightUSA == .lbp) {
                currentWeightUSA = .usTons
                
            } else if (currentWeightUSA == .usTons) {
                currentWeightUSA = .oz
                
            }
        }

        
        updateWeight()
        updateText()

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

}

