/// @arg {real} time Time of the keyframe.
/// @arg {real} value Value of the keyframe.
/// @arg {real} ease Type of the interpolation function.
function MyKeyframe(time, value, ease = EASE.LINEAR) constructor
{
	m_time = time;
	m_value = value;
	m_ease = ease;
	
	/// @returns {real}
	get_time = function() 
	{
		return m_time;
	}
	
	/// @returns {real}
	get_value = function() 
	{
		return m_value;
	}
	
	/// @arg {real} value
	set_value = function(value)
	{
		m_value = value;
	}
	
	/// @returns {real}
	get_ease = function()
	{
		return m_ease;
	}
	
	/// @arg {real} value
	set_ease = function(value)
	{
		m_ease = value;
	}
	
	/// @arg {Struct.MyKeyframe} b
	/// @arg {real} t
	/// @returns {real}
	interpolate = function(b, t)
	{
		t = inv_lerp(m_time, b.m_time, t);
		return ease_interpolate(m_value, b.m_value, t, b.m_ease);
	}
}