

# This shell script is for the 1st task of the second homework.
# I made and uploaded WorkPlaceViolenceData.txt .
# Using WorkPlaceViolenceData.txt as a parameter, this shell script will do the following:

#-----------------------------------------
# a) Give the workplaces where no violent act has been reported. If none, then writes "NONE"

lines=`wc -l < $1`

echo ""
echo "Workplaces with no violent incidents:"

for i in `seq $lines`
do
	check=`cat $1 | grep 1 | cut -f3 -d ',' | head -$i | tail -1`
	
	if [ $check == 0 ]
	then
		cat $1 | grep 1 | cut -f1 -d ',' | head -$i | tail -1
	else
		reports=`expr $reports + 1`
	fi
done

if [ $reports == $lines ]
then
	echo "NONE"
fi
echo ""

#-----------------------------------------
# b) Count the total number of security guards according to the data file provided

for i in `seq $lines`
do
	security=`cat $1 | grep 1 | cut -f4 -d ',' | head -$i | tail -1`
	
	count=`expr $count + $security`
done

echo "The total number of security guards: $count"
echo ""

#----------------------------------------w
# c) Give the names of the workplaces with the highest number of violent incidents are located,
# give their names and addresses

maxNum=0

for i in `seq $lines`
do
	num=`cat $1 | grep 1 | cut -f3 -d ',' | head -$i | tail -1`

	if [ "$num" -gt "$maxNum" ]
	then
		maxNum=$num
	fi
done

> MaxViolence.txt

for i in `seq $lines`
do
	check=`cat $1 | grep 1 | cut -f3 -d ',' | head -$i | tail -1`
	
	if [ "$check" == "$maxNum" ]
	then
		name=`cat $1 | grep 1 | cut -f1 -d ',' | head -$i | tail -1`
		address=`cat $1 | grep 1 | cut -f2 -d ',' | head -$i | tail -1`
		
		echo "$name,$address" >> MaxViolence.txt
	fi
done

echo "Names and addresses of workplaces with the most violent incidents: "
cat MaxViolence.txt
echo ""
