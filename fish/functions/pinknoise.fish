function pinknoise --description 'Generate pink noise'
	play -c 2 -n synth pinknoise band -n 2500 4000 tremolo 0.03 5 reverb 20 gain -l 10
end
