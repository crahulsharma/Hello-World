TODAY=`date +%a`
takeDailySnapshot(){

        if [ "$TODAY" != "Sun" ] 
        then 

	echo "Delete Snapshot"
	LAST_SNAPSHOT=` ls -lh /root/testing/|  grep Sun  | awk '{ print  $9 }'`
        
        until [ "$LAST_SNAPSHOT" == "" ]
        do
        cd /root/testing	
        /bin/rm -rf  $LAST_SNAPSHOT
        LAST_SNAPSHOT=` ls -lh /root/testing/|  grep Sun  | awk '{ print  $9 }'`
 
	
        done
        

        echo "Create Snapshot"
	cd /root/testing
        /bin/touch  a.Sun
	SNAPSHOT_STATUS=` ls -lh /root/testing/|  grep Sun  | awk '{ print  $9 }'`	
	until [ "$SNAPSHOT_STATUS" == "a.Sun" ]
	do
		sleep 10
		SNAPSHOT_STATUS=` ls -lh /root/testing/|  grep Sun  | awk '{ print  $9 }'`		
	done
	
        fi

   
  

}
takeDailySnapshot
