function MySequence() constructor
{
	m_keyframes = [];
	
	/// @arg {Struct.MyKeyframe} _keyframe
	/// @returns {undefined}
	add = function(keyframe)
	{
		var insertion_point = binary_search(m_keyframes, keyframe.m_time) + 1;
		array_insert(m_keyframes, insertion_point, keyframe);
	}
	
	/// @arg {real} _t
	/// @returns {real}
	evaluate = function(t)
	{
		var keyframes = m_keyframes;
		var keyframes_count = array_length(keyframes);
	
		if(keyframes_count == 0)
		{
			return 0;
		}	
		
		if(keyframes_count == 1)
		{
			return array_first(keyframes).value;
		}
		
		if(keyframes_count == 2)
		{
			return keyframes[0].interpolate(keyframes[1], t);
		}
		
		var first_keyframe = array_first(keyframes);
	
		if(t <= first_keyframe.m_time)
		{
			return first_keyframe.value;
		}
	
		var last_keyframe = array_last(keyframes);
	
		if(t >= last_keyframe.m_time)
		{
			return last_keyframe.value;
		}
	
		var start_keyframe_index = binary_search(keyframes, t);
		var end_keyframe_index = start_keyframe_index + 1;
	
		var start_keyframe = keyframes[start_keyframe_index];
		var end_keyframe = keyframes[end_keyframe_index];
	
		return start_keyframe.interpolate(end_keyframe, t);
	}
}

/// @param {Array<Struct.MyKeyframe>} array
/// @param {real} t
/// @return {real}
function binary_search(array, t)
{
	var l = 0;
	var r = array_length(array);
	
	while(l < r)
	{
		var mid = (l + r) / 2;	
		var item = array[mid];
		
		if(t < item.m_time)
		{
			r = mid;
		}
		else if(t > item.m_time)
		{
			l = mid;
		}
		else 
		{
			return mid;
		}
	}
	
	return r - 1;
}