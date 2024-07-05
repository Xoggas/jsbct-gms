Sequence = {
	keyframes: [],
}

function Sequence() constructor
{
}

function sequence_add(_sequence, _keyframe)
{
	_insertion_point = binary_search(_sequence.keyframes, _keyframe.p_time);

	array_insert(_sequence.keyframes, _insertion_point, _keyframe);
	
	return _sequence;
}

function sequence_evaluate(_sequence, _t)
{
	_keyframes_count = array_length(_sequence.keyframes);
	
	if(_keyframes_count == 0)
	{
		return 0;
	}	
		
	if(_keyframes_count == 1)
	{
		return array_first(_sequence.keyframes).value;
	}
		
	if(_keyframes_count == 2)
	{
		_start_keyframe = _sequence.keyframes[0];
		_end_keyframe = _sequence.keyframes[1];
		return keyframe_interpolate(_start_keyframe, _end_keyframe, _t);
	}
		
	_first_keyframe = array_first(_sequence.keyframes);
	
	if(_t <= _first_keyframe.p_time)
	{
		return _first_keyframe.value;
	}
	
	_last_keyframe = array_last(_sequence.keyframes);
	
	if(_t >= _last_keyframe.p_time)
	{
		return _last_keyframe.value;
	}
	
	_start_keyframe_index = binary_search(_sequence.keyframes, _t);
	_end_keyframe_index = _start_keyframe_index + 1;
	
	return keyframe_interpolate(_sequence.keyframes[_start_keyframe_index], _sequence.keyframes[_end_keyframe_index], _t);
}

function binary_search(_array, _t)
{
	_l = 0;
	_r = array_length(_array);
	
	while(_l < _r)
	{
		_mid = (_l + _r) / 2;	
		_item = _array[_mid];
		
		if(_t < _item.p_time)
		{
			_r = _mid;
		}
		else if(_t > item.p_time)
		{
			_l = _mid;
		}
		else 
		{
			return _mid;
		}
	}
	
	return r == 0 ? 0 : r - 1;
}