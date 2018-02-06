Pod::Spec.new do |s|

  s.name         = "StepUpTextField"
  s.version      = "0.1.1"
  s.license      = "MIT"
  s.summary      = "TextField that works like stepper to increment and decrement."
  s.description  = <<-DESC
                   This is the text field which can be used in application when there is a need of textfield with functionality of incement and decrement like count of items of your grocery, in which you can mention min value, max value and also the stepSize if you want to increase/ decrease more than one at a time..
                   DESC
  s.homepage     = "https://github.com/HardikBhavsar7/StepUpTextField"
  s.author       = { "Hardik Bhavsar" => "b.hardik5296@gmail.com" }
  s.ios.deployment_target = '10.0'
  s.source 	 = { :git => "https://github.com/HardikBhavsar7/StepUpTextField.git", :tag => s.version.to_s }
  s.source_files = "StepUpTextFieldDemo/StepUpTextFieldDemo/Source/StepUpTextField.swift"
  s.swift_version = "3.2"
end
