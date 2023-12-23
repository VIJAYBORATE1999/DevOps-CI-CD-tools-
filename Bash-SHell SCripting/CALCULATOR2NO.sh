#cOMMAND LINE ARGUMNETS 
num1="$1"
operator="$2"
num2="$3"

# Perform the calculation based on the operator
#When comparing strings, you should use the = operator. -eq is used for comparing integers.
if [ "$operator" = "+" ]; then
    result=$((num1 + num2))
    echo "ADDITION OF $num1 and $num2 is : $result"
elif [ "$operator" = "-" ]; then
    result=$((num1 - num2))
    echo "SUBTRACTION OF $num1 and $num2 is : $result"
elif [ "$operator" = "*" ]; then
    result=$((num1 * num2))
    echo "MULTIPLICATION OF $num1 and $num2 is : $result"
elif [ "$operator" = "/" ]; then
    # Check if num2 is not zero to avoid division by zero error
    if [ "$num2" -eq 0 ]; then
        echo "Division by zero is not allowed."
        exit 1
    fi
    result=$((num1 / num2))
    echo "DIVISION OF $num1 by $num2 is : $result"
fi
