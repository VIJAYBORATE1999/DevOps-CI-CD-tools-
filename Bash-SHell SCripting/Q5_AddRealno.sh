echo "ENTER FIRST NUMBER"
read n1
echo "ENTER SECOND NUMBER"
read n2
result=$(echo "$n1 + $n2" | bc)
echo "addition is $result"
