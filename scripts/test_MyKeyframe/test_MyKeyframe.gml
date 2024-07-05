function TestMyKeyframe() : TestSuite("MyKeyframe Tests") constructor
{
	it("Creates keyframe - get_time() should return 0", function() 
	{
		var keyframe = new MyKeyframe(0, 0, EASE.LINEAR);
		
		Assert.is_true(keyframe.get_time() == 0);
	});
}