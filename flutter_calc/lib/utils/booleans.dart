
bool isOperator(String operator){
  if (operator == "%" || operator == "/" || operator == "*" || operator == "+" || 
  operator == "-" || operator == "=" || operator == "DEL" || operator == "CE" || operator == "C") {
    return true;
  }
  return false;
}