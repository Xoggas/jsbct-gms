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

/// @arg {real} a
/// @arg {real} b
/// @arg {real} v
/// @arg {real} _ease
/// @returns {real}
function ease_interpolate(a, b, v, _ease)
{
	switch(_ease)
	{
		case EASE.INSTANT:
			return ease_instant(a, b, v);
		case EASE.LINEAR:
			return ease_linear(a, b, v);
		case EASE.IN_SINE:
			return ease_in_sine(a, b, v);
		case EASE.OUT_SINE:
			return ease_out_sine(a, b, v);
		case EASE.IN_OUT_SINE:
			return ease_in_out_sine(a, b, v);
		case EASE.IN_QUAD:
			return ease_in_quad(a, b, v);
		case EASE.OUT_QUAD:
			return ease_out_quad(a, b, v);
		case EASE.IN_OUT_QUAD:
			return ease_in_out_quad(a, b, v);
		case EASE.IN_CUBIC: 
			return ease_in_cubic(a, b, v);
		case EASE.OUT_CUBIC:
			return ease_out_cubic(a, b, v);
		case EASE.IN_OUT_CUBIC:
			return ease_in_out_cubic(a, b, v);
		case EASE.IN_QUINT: 
			return ease_in_quint(a, b, v);
		case EASE.OUT_QUINT: 
			return ease_out_quint(a, b, v);
		case EASE.IN_OUT_QUINT: 
			return ease_in_out_quint(a, b, v);
		case EASE.IN_EXPO: 
			return ease_in_expo(a, b, v);
		case EASE.OUT_EXPO: 
			return ease_out_expo(a, b, v);
		case EASE.IN_OUT_EXPO: 
			return ease_in_out_expo(a, b, v);
		case EASE.IN_CIRC:
			return ease_in_circ(a, b, v);
		case EASE.OUT_CIRC: 
			return ease_out_circ(a, b, v);
		case EASE.IN_OUT_CIRC: 
			return ease_in_out_circ(a, b, v);
		case EASE.IN_BACK: 
			return ease_inback(a, b, v);
		case EASE.OUT_BACK: 
			return ease_outback(a, b, v);
		case EASE.IN_OUT_BACK: 
			return ease_in_outback(a, b, v);
		default:
			throw "This easing isn't defined!";
	}
}

function ease_instant(a, b, v)
{
	return lerp(a, b, round(v));
}

function ease_linear(a, b, v)
{
	return lerp(a, b, v);
}

function ease_in_sine(a, b, v)
{
	return lerp(a, b,  1 - cos((v * pi) / 2));
}

function ease_out_sine(a, b, v)
{
	return lerp(a, b, sin((v * pi) / 2));
}

function ease_in_out_sine(a, b, v)
{
	return lerp(a, b, -(cos(pi * v) - 1) / 2);
}

function ease_in_quad(a, b, v)
{
	return lerp(a, b, v * v);
}

function ease_out_quad(a, b, v)
{
	return lerp(a, b, 1 - (1 - v) * (1 - v));
}

function ease_in_out_quad(a, b, v)
{
	v = v < 0.5 ? 2 * v * v : 1 - power(-2 * v + 2, 2) / 2;
	return lerp(a, b, v);
}

function ease_in_cubic(a, b, v)
{
	return lerp(a, b, v * v * v);
}

function ease_out_cubic(a, b, v)
{
	return lerp(a, b, 1 - power(1 - v, 3));
}

function ease_in_out_cubic(a, b, v)
{
	v = v < 0.5 ? 4 * v * v * v : 1 - power(-2 * v + 2, 3) / 2;
	return lerp(a, b, v);
}

function ease_in_quint(a, b, v)
{
	return lerp(a, b, power(v, 5));
}

function ease_out_quint(a, b, v)
{
	return lerp(a, b, 1 - power(1 - v, 5));
}

function ease_in_out_quint(a, b, v)
{
	v = v < 0.5 ? 16 * power(v, 5) : 1 - power(-2 * v + 2, 5) / 2;
	return lerp(a, b, v);
}

function ease_in_expo(a, b, v)
{
	v = v == 0 ? 0 : power(2, 10 * v - 10);
	return lerp(a, b, v);
}

function ease_out_expo(a, b, v)
{
	v = v == 1 ? 1 : 1 - power(2, -10 * v);
	return lerp(a, b, v);
}

function ease_in_out_expo(a, b, v)
{
	if(v == 0)
	{
		return a;
	}
	else if(v == 1)
	{
		return b;
	}
	else
	{
		v = v < 0.5 
			? power(2, 20 * v - 10) / 2 
			: (2 - power(2, -20 * v + 10)) / 2;
		return lerp(a, b, v);
	}
}

function ease_in_circ(a, b, v)
{
	v = 1 - sqrt(1 - power(v, 2));
	return lerp(a, b, v);
}

function ease_out_circ(a, b, v)
{
	v = sqrt(1 - power(v - 1, 2));
	return lerp(a, b, v);
}

function ease_in_out_circ(a, b, v)
{
	if(v < 0.5)
	{
		v = sqrt(1 - power(v - 1, 2));
	}
	else
	{
		v = (sqrt(1 - power(-2 * v + 2, 2)) + 1) / 2;
	}
	
	return lerp(a, b, v);
}

function ease_inback(a, b, v)
{
	var c1 = 1.70158;
	var c3 = c1 + 1;
	
	v = c3 * power(v, 3) - c1 * power(v, 2);
	
	return lerp(a, b, v);
}

function ease_outback(a, b, v)
{
	var c1 = 1.70158;
	var c3 = c1 + 1;

	v = 1 + c3 * power(v - 1, 3) + c1 * power(v - 1, 2);
	
	return lerp(a, b, v);
}

function ease_in_outback(a, b, v)
{
	var c1 = 1.70158;
	var c2 = c1 * 1.525;

	if(v < 0.5)
	{
		v = (power(2 * v, 2) * ((c2 + 1) * 2 * v - c2)) / 2;
	}
	else
	{
		v = (power(2 * v - 2, 2) * ((c2 + 1) * (v * 2 - 2) + c2) + 2) / 2;
	}
	
	return lerp(a, b, v);
}