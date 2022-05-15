import Debug "mo:base/Debug";
actor DBank{
  var currValue = 300;
  currValue := 100;
  let id = 3094372904823;
// id := 392 //you cant change const (let)
  Debug.print(debug_show(id));
};
