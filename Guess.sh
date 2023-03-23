guess=$(($RANDOM % 100))
printf "Please guess a number between 0 and 99 (inclusive) > "
read user_guess

while [ "${guess}" != "${user_guess}" ]
do
        i=0
        n=${#user_guess}
        while [ $i -lt $n ]
        do
                part=${user_guess:$i:1}
                (( i++ ))
                if [[ "$part" > "9" ]] || [[ "$part" < "0" ]];
                then
                        echo "Please enter a number between 0 and 99 (inclusive)"
                        read user_guess
                        n=${#user_guess}
                        i=0
                fi
        done

        guess_num=$((10#${guess}+0))
        user_guess_num=$((10#${user_guess}+0))
        if [ 0 -gt $user_guess_num ] || [ 99 -lt $user_guess_num ] ;
        then
                echo "Please enter a number between 0 and 99 (inclusive)"
        elif [ $guess_num -gt $user_guess_num ];then
                echo  "Higher!"
                printf "Please guess again > "
        else
                echo "Lower!"
                printf "Please guess again > "
        fi
        read user_guess
done
echo "You got it!"
