#INITIALIZE VARIABLES
   cut=false
while getopts luf-: OPTION
  do
        case $OPTION in
        f) files=true;;
        d) directory=true;;
        esac
done
 
  shift $[$OPTIND-1]

#for loop in $#
#do
#	if (

#function remove_A_file()
#{




#} 

function display()
{
	for i in $*
	do
		if [ $i = "remove" ]  #I could use "$0"
		then
			echo "Attempting to delete remove $i operation aborted  "
			exit 1
			
		#Check if the name is not remove to avoid deleting the main file
		
#		elif [ $i != "remove" ]
#		then
		else	
			#echo "$i"

			#If no name is provided
                  if [ $# -eq 0 ]
                  then
                       	echo "provide an argument, please"
             		exit 1
			fi

			#check if it is a directory
                  if [ -d "$i" ]
                  then
                 	  	echo "The $i is a Directory "
				continue
                  fi

			#check if file exists
                  if [ ! -f "$i"  ]
                  then
                        echo "This is not a file "
                  fi

		
			#find the "deleted directory in home" if it doesnt exist create it	
			ls -d ~/deleted 2>/dev/null
			find_directory=$(echo $?)
			if [ ! $find_directory -eq 0 ]
			then
				echo "dir not found "
				mkdir ~/deleted
			fi
			
			#move the removed file in the home/deleted and copy on to .restore.info
 			inode=$(ls -li $i | cut -d " " -f1)

		 	filename=$(basename ${i})
                  DIR=$(dirname "${i}")
                  file_directory_name=$(echo "${DIR}")

			deleted_filename=$(echo "$filename"_"$inode")
			mv $i ~/deleted/$deleted_filename
				
			#move the names in the restore file
			echo "$deleted_filename":"$i" >> ~/.restore.info
			
			#get the path of a file
			#if [[ -f name ]]
			#then 
			#	path=echo "$(find ~/ -name $i -printf '%h\n') " 
			#else
			#	echo "$i is not a file "
			#fi
		#get the path of a directory
			#if [ -d name ]
			#then
			#	path=echo"$(find ~/ -type d -name $i)"
			#else
			
			#	echo "$i is not a directory"
			#fi
		fi
	done
}


for loop in $@
do
 display $loop
done






