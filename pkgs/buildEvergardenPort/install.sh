# shellcheck shell=bash
# shellcheck disable=SC2154

runHook preInstall

if [[ -z "${targets[*]}" ]]; then
	target_array=("themes")
else
	read -r -a target_array <<<"$targets"
fi

if [[ ${#target_array[@]} -gt 1 ]]; then
	mkdir -p "$out"

	for target in "${target_array[@]}"; do
		cp -r "$target" "$out"
	done
else
	mkdir -p "$out"

	cp -r "${target_array[0]}/"* "$out"
fi

runHook postInstall
