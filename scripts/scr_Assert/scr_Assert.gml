function Assert() constructor
{
	/// @arg {any} a
	/// @arg {any} b
	static are_equal = function(a, b)
	{
		if(a != b)
		{
			throw string("{0} != {1}", a, b);
		}
	}
	
	/// @arg {any} a
	/// @arg {any} b
	static are_not_equal = function(a, b)
	{
		if(a == b)
		{
			throw string("{0} == {1}", a, b);
		}
	}
	
	/// @arg {bool} v
	static is_false = function(v)
	{
		if(v == true)
		{
			throw "The value was true";
		}
	}
	
	/// @arg {bool} v
	static is_true = function(v)
	{
		if(v == false)
		{
			throw "The value was false";
		}
	}
	
	/// @arg {function} callback
	static throws_exception = function(callback)
	{
		try
		{
			callback();
		}
		catch(exception)
		{
			throw "Callback throwed an exception";
		}
	}
}