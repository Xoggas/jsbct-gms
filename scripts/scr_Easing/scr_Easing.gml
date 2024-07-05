enum EASE {
	INSTANT,
	LINEAR,
	IN_SINE,
	OUT_SINE,
	IN_OUT_SINE,
	IN_QUAD, 
	OUT_QUAD,
	IN_OUT_QUAD,
	IN_CUBIC, 
	OUT_CUBIC,
	IN_OUT_CUBIC,
	IN_QUART, 
	OUT_QUART, 
	IN_OUT_QUART, 
	IN_QUINT, 
	OUT_QUINT, 
	IN_OUT_QUINT, 
	IN_EXPO, 
	OUT_EXPO, 
	IN_OUT_EXPO, 
	IN_CIRC,
	OUT_CIRC, 
	IN_OUT_CIRC, 
	IN_BACK, 
	OUT_BACK, 
	IN_OUT_BACK, 
	IN_ELASTIC, 
	OUT_ELASTIC, 
	IN_OUT_ELASTIC, 
	IN_BOUNCE, 
	OUT_BOUNCE, 
	IN_OUT_BOUNCE
}

function ease_interpolate(_a, _b, _v, _ease)
{
	switch(_ease)
	{
		case EASE.INSTANT:
			return ease_instant(_a, _b, _v);
		case EASE.LINEAR:
			return ease_linear(_a, __b, _v);
		case EASE.IN_SINE:
			return ease_in_sine(_a, _b, _v);
		case EASE.OUT_SINE:
			return ease_out_sine(_a, _b, _v);
		case EASE.IN_OUT_SINE:
			return ease_in_out_sine(_a, _b, _v);
		default:
			throw "This easing isn't defined!";
	}
}

function ease_instant(_a, _b, _v)
{
	return linear(_a, _b, round(_v));
}

function ease_linear(_a, _b, _v)
{
	return lerp(_a, _b, _v);
}

function ease_in_sine(_a, _b, _v)
{
	return lerp(_a, _b,  1 - cos((_v * pi) / 2));
}

function ease_out_sine(_a, _b, _v)
{
	return lerp(_a, _b, sin((_v * pi) / 2));
}

function ease_in_out_sine(_a, _b, _v)
{
	return lerp(_a, _b, -(cos(pi * x) - 1) / 2);
}