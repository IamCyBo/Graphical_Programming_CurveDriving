package unitTests;

import resources.vect;
import resources.arr_m;
import units.si.m;
import assert.Assert;

import myCar.Route;

singleton class RouteTest {

	Route testee;
	Assert Assert;
	
	// Insert the current route here
	private arr_m testeeX[9] = {0.0[m], 10.264[m], 92.392[m], 128.309[m], 154.688[m], 184.725[m], 380.987[m]};
	private arr_m testeeY[9] = {0.0[m], 9.977[m], 94.244[m], 126.387[m], 146.327[m], 67.368[m], 276.906[m]};

	@Test
	public void testCalc() {
		integer point = 2;
		m expected_pointX = testeeX[point];
		m expected_pointY = testeeY[point];
		
		testee.calc(point); 
		
		Assert.assertEqual(testee.focuspoint[0]/1[m], expected_pointX/1[m]);
		Assert.assertEqual(testee.focuspoint[1]/1[m], expected_pointY/1[m]);
		Assert.assertFalse(testee.lastElement);
	}
	
	@Test
	public void testCalc2() {
		integer point = testeeX.length(0)-1;
		m expected_pointX = testeeX[point];
		m expected_pointY = testeeY[point];
		
		testee.calc(point); 
		
		Assert.assertEqual(testee.focuspoint[0]/1[m], expected_pointX/1[m]);
		Assert.assertEqual(testee.focuspoint[1]/1[m], expected_pointY/1[m]);
		Assert.assertTrue(testee.lastElement);
	}

	@Test
	public void testPoint_distance() {
		//TODO
		//point_distance_return = testee.point_distance(point_distance_point_in); 

        // TODO: Replace this call with appropriate assertions to implement your test
		Assert.unimplemented();
	}
}