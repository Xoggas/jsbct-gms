/// @param {Struct.MySequence} sequence
/// @param {Function} setter
function AnimationBinding(sequence, setter) constructor 
{
	m_sequence = sequence;
	m_setter = setter;
	
	/// @param {real} t Time value.
	/// @returns {undefined}
	update = function(t)
	{
		m_setter(m_sequence.evaluate(t));
	}
}