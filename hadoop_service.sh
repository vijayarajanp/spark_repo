echo "\n SYNTAX: <service_name> [start|stop|restart|status]"
echo "Service = hadoop, hive, yarn, jobhistory, mysql"
#Declaration Part
cmd_lst=("hadoop" "hive" "yarn" "jobhistory" "mysql")

ser_lst=(
	"hadoop:list"
        "mysql:service mysqld"
	"hive:list"
	"jobhistory:mr-jobhistory-daemon.sh"
        "yarn:start-yarn.sh"
)

hive=("vijay")

#echo $1 $2
# ******************* Input **********************
in_1=$1
in_2=$2
# ******************* Functions *******************

mylst(){
 new_arr=("${!1}")
 for ln in "${new_arr[@]}" ; do
  #echo $ln
  if [ "$ln" = "$2" ]; then
    echo $ln
    exit 1
  fi
 done
}

# ******************* Command Validation ******************************
out=$(mylst "cmd_lst[@]"  "$in_1")

if [ -z "$out" ]; then 
  echo "Invalid Command"
  exit 0 
#else 
#  echo $out 
fi

# ******************* Service Validation ******************************
#var=$out[@]
#n_arr=("${!var}")
#out2=$(mylst "n_arr[@]" "vijay")
#echo $out2

f_cmd=$out

for ser in "${ser_lst[@]}" ; do
  c_name="${ser%%:*}"
  s_name="${ser##*:}"
 #echo $c_name 
  if [ "$f_cmd" == "$c_name" ]; then
    echo $s_name
    exit 1
  fi
done

if [ -z "$s_name" ]; then
  echo "Invalid Command"
  exit 0
else
  echo $s_name
fi

