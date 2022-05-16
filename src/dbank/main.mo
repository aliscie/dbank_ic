import Debug "mo:base/Debug";
actor DBank{
    var currValue = 300; //Motoko can infer that 300 is Nat so you dont need to add : Nat
//    currValue := 100;

    public func topUp(amount : Nat){
        currValue += amount;
        Debug.print(debug_show(currValue));
    };

//    Note the update functions will go through consensus process which may take too much time
    public func withdraw(amount : Nat){
        if (amount < currValue){
        currValue -= amount;
        Debug.print(debug_show(currValue));
        } else {
        Debug.print("You don't have enough balance.");
        }
    };

    public query func getBalance(): async Nat{
        return currValue
    };



};
