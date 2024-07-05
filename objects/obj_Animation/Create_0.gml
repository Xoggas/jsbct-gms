var _sequence = new MySequence();
_sequence.add(new MyKeyframe(0, 320, EASE.IN_OUT_BACK));
_sequence.add(new MyKeyframe(5, 960, EASE.IN_OUT_BACK));
_sequence.add(new MyKeyframe(10, 320, EASE.IN_OUT_BACK));

binding_x = new AnimationBinding(_sequence, function(_v)
{
	x = _v;
});

var _sequence2 = new MySequence();
_sequence2.add(new MyKeyframe(0, 180, EASE.IN_OUT_BACK));
_sequence2.add(new MyKeyframe(5, 540, EASE.IN_OUT_BACK));
_sequence2.add(new MyKeyframe(10, 180, EASE.IN_OUT_BACK));

binding_y = new AnimationBinding(_sequence2, function(_v)
{
	y = _v;
});