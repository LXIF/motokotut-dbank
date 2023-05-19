import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  //currentValue := 300;

  //let id = 139485798234578917284539;
  
  // Debug.print(debug_show(id));

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));  

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
      Debug.print(debug_show("howdyyyyy"));
    } else {
      Debug.print("oh noes! not enoufff")
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public query func getStartTime(): async Int {
    return startTime;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.0001 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }
}