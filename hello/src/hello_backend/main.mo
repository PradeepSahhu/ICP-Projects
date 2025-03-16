import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBankSystem {

  stable var currentAmount : Float = 1000;

  // currentAmount := 10000;

  stable var startTime : Int = Time.now();

  Debug.print(debug_show (currentAmount));

  public func topUp(increaseAmount : Float) {

    currentAmount += increaseAmount;

    Debug.print(debug_show (currentAmount));
  };

  public func withdraw(withdrawAmount : Float) {

    let tempValue : Float = currentAmount - withdrawAmount;

    if (tempValue >= 0) {

      currentAmount -= withdrawAmount;

      Debug.print(debug_show (currentAmount));
    } else {
      Debug.print("Amount value is too larget for this to handle");
    };
  };

  public query func getCurrentBalance() : async Float {

    return currentAmount;
  };

  public query func getCurrTime() : async Int {
    return Time.now();
  };

  public func Compound() {

    var currTime = Time.now();
    var TimeEsclappsed = (currTime - startTime) / 100000000;
    currentAmount := currentAmount + (1.01 ** Float.fromInt(TimeEsclappsed));
    startTime := currTime;

  }

};
