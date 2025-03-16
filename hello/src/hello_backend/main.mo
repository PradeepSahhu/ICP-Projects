import Debug "mo:base/Debug";

actor DBankSystem {

  var currentAmount = 1000;

  currentAmount := 10000;

  Debug.print(debug_show (currentAmount));

  public func topUp() {

    currentAmount += 1;

    Debug.print(debug_show (currentAmount));
  }

};
