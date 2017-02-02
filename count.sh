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
dates="$[($(date -d2017-2-11T20+08:00 +%s)-$(date +%s)+43200)/86400-1]"
echo "还有$dates天"
echo "每天要做$[($papers-$paperDones)/$dates+1]张试卷，写$[($voids-$voidDones)/$dates+1]张白纸"
