function array::rename() {
	local _array="$1";
	local _array_new_name="$2";
	local _arr_alloc;
	_arr_alloc=$(declare -p "$_array");
	_arr_alloc="${_arr_alloc/declare -a $_array/$_array_new_name}";
	eval "$_arr_alloc"; # Now we have the renamed array and allocated in new name.
	unset "$_array"; # Deallocate the original array.
}
