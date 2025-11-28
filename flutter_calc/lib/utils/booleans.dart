
bool isOperator(String operator){
  if (operator == "%" || operator == "/" || operator == "*" || operator == "+" || 
  operator == "-" || operator == "=" || operator == "DEL" || operator == "C") {
    return true;
  }
  return false;
}