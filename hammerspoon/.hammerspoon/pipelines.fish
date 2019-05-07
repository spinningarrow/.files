#!/usr/local/bin/fish

fly -t $argv pipelines | cut -d' ' -f1 | while read p
	echo -n $p
	fly -t $argv jobs -p $p | grep failed > /dev/null
	echo '' $status
end
