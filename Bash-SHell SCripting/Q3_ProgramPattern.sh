echo "Enter a Number"
read number
for i in $(seq 1 $number); do
    for j in $(seq $i $((i + i))); do
        echo -n "$j "
    done
    echo
done
