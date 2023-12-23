##--> $# means that count of argumnets given 
if [ "$#" -eq 0 ]; then
  echo "Atlest give one argumnet ....EXITING SCRIPT"
  exit 1
fi

max="$1"

##--> $@ ITERATING OVER ALL THE CMD arugumnts. when you iterate through $@, each element in $@ will be assigned to the variable num one by one.
for num in "$@"; do
  if ((num > max)); then
    max="$num"
  fi
done
echo "Largest no is $max"
