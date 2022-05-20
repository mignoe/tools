function get_file_size(){
    file_info=$(wc -c $1)
    searchstring=" "
    rest=${file_info#*$searchstring}
    length=$(( ${#file_info} - ${#rest} - ${#searchstring} ))
    
    index=$(( ${#file_info} - ${#rest} - ${#searchstring} ))
    file_size=${file_info:0:index}

    echo $file_size
}

echo gets till here
file_size=$(get_file_size $1)
last_time_changed=$(date +"%T")

while (true)
do     
    clear
    javac $1
    actual_file_size=$(get_file_size $1)
    if [  $actual_file_size != $file_size ];
    then
        echo "Changed!";
        file_size=$actual_file_size
        last_time_updated=$(date +"%T")
    fi
    echo "---> Last time changed: $last_time_changed <---"
    sleep 3s
done
