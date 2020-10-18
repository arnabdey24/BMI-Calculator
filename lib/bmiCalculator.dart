
class BMI{
  final int _height;
  final int _weight;
  double _bmi;

  BMI(this._height, this._weight);

  String value(){
    _bmi=_weight/((_height/100)*(_height/100));
    return _bmi.toStringAsFixed(1);
  }
  String getStatus(){
    if(_bmi>=25){
      return "Overweight";
    }
    else if(_bmi>18.5){
      return "Normal";
    }
    else{
      return "Underweight";
    }
  }
  String getMsg(){
    if(_bmi>=25){
      return "You have a higher than normal body weight. Try to exercise more.";
    }
    else if(_bmi>18.5){
      return "You have a normal body weight. Good job!";
    }
    else{
      return "You have a lower than normal body weight. You can eat bit more.";
    }
  }
}