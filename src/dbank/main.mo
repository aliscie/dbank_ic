import Debug "mo:base/Debug";
import Time  "mo:base/Time";
import Float  "mo:base/Float";

actor DBank{
    stable var initialTime = Time.now();
    stable var currValue : Float = 300; //Motoko can infer that 300 is Nat so you dont need to add : Nat
    currValue := 300;

    public func topUp(amount : Float){
        currValue += amount;
        Debug.print(debug_show(currValue));
    };

//    Note the update functions will go through consensus process which may take too much time
    public func withdraw(amount : Float){
        if (amount < currValue){
        currValue -= amount;
        Debug.print(debug_show(currValue));
        } else {
        Debug.print("You don't have enough balance.");
        }
    };

    public query func getBalance(): async Float{
        return currValue
    };

    public func compoundInterst(){
    let current_time = Time.now();
    let timePassed = current_time - initialTime;
    let time_passed_in_nano_s = timePassed/(10**9);
    currValue := currValue * (1.01 ** Float.fromInt(time_passed_in_nano_s));
    initialTime := current_time;
    Debug.print(debug_show(currValue));
    }

};
