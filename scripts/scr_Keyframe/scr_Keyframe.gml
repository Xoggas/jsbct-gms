Keyframe = {
	value: 0, 
	ease: EASE.LINEAR,
	p_time: 0,
}

function Keyframe(_time, _value, _ease = EASE.LINEAR) constructor
{
	p_time = _time;
	value = _value;
	ease = _ease;
}

function keyframe_interpolate(_a, _b, _t)
{
	_t = inv_lerp(_a.p_time, _b.p_time, _t);
	return ease_interpolate(_a.value, _b.value, _t, _b.ease);
}
