#!/bin/bash
n() {
	if echo "$*"|grep '^[[:digit:]]*$'>/dev/null ;then
		echo "$*"
	else
		echo 0
	fi
}
papers=0
paperDones=0
voids=0
voidDones=0
for paper in $(cat "$@" | awk '{print $2}') ;do
	let papers+=$(n $paper)
done
for void in $(cat "$@" | awk '{print $3}') ;do
	let voids+=$(n $void)
done
for paperDone in $(cat "$@" | awk '{print $5}') ;do
	let paperDones+=$(n $paperDone)
done
for voidDone in $(cat "$@" | awk '{print $6}') ;do
	let voidDones+=$(n $voidDone)
done
echo "试卷：$paperDones/$papers，白纸：$voidDones/$voids"
echo "还有$[($(date -d2017-2-12 +%s)-$(date +%s))/86400+1]天"
