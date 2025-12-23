echo "Running unit tests:"

for i in test/test_*
do
    if test -f $i
    then
	if $VALGRIND ./$i 2>> test/runtests.log
	then
	    echo $i PASS
	else
	    echo "[ERROR] error in test $i: here's the tail of test/runtests.log"
	    echo "----------"
	    tail test/runtests.log
	    exit 1
	fi
    fi
done

echo ""
