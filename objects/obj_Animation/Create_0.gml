var sequence_x = new MySequence();
sequence_x.add(new MyKeyframe(0, 320, EASE.IN_OUT_BACK));
sequence_x.add(new MyKeyframe(5, 960, EASE.IN_OUT_BACK));
sequence_x.add(new MyKeyframe(10, 320, EASE.IN_OUT_BACK));

var sequence_y = new MySequence();
sequence_y.add(new MyKeyframe(0, 180, EASE.IN_OUT_BACK));
sequence_y.add(new MyKeyframe(5, 540, EASE.IN_OUT_BACK));
sequence_y.add(new MyKeyframe(10, 180, EASE.IN_OUT_BACK));

m_binding_x = new AnimationBinding(sequence_x, function(value) { x = value });
m_binding_y = new AnimationBinding(sequence_y, function(value) { y = value });