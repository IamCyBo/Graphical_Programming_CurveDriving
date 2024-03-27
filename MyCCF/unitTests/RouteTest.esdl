package unitTests;

import resources.arr_m;
import resources.vect;
import units.si.m;
import assert.Assert;
import vectorOperations.vectOps;

import myCar.Route;

singleton class RouteTest {

	Route testee;
	Assert Assert;
	vectOps vect;
	
	// Insert the current route here
	private arr_m testeeX[7] = {0.0[m], 10.264[m], 92.392[m], 128.309[m], 154.688[m], 184.725[m], 380.987[m]};
	private arr_m testeeY[7] = {0.0[m], 9.977[m], 94.244[m], 126.387[m], 146.327[m], 67.368[m], 276.906[m]};

	@Test
	public void testCalc() {
		integer point = 2;
		m expected_pointX = testeeX[point];
		m expected_pointY = testeeY[point];
		m expected_distance = 0[m];
		
		testee.calc(point); 
		
		Assert.assertEqual(testee.focuspoint[0]/1[m], expected_pointX/1[m]);
		Assert.assertEqual(testee.focuspoint[1]/1[m], expected_pointY/1[m]);
		Assert.assertNear(testee.distanceFocusEnd/1[m], 452.842, 0.1);
		
		
	}
	
	@Test
	public void testCalc2() {
		integer point = testeeX.length(0)-1;
		m expected_pointX = testeeX[point];
		m expected_pointY = testeeY[point];
		
		testee.calc(point); 
		
		Assert.assertEqual(testee.focuspoint[0]/1[m], expected_pointX/1[m]);
		Assert.assertEqual(testee.focuspoint[1]/1[m], expected_pointY/1[m]);
		Assert.assertEqual(testee.distanceFocusEnd/1[m], 0);
	}

	@Test
	public void testPoint_distance() {
		vect point = vect.getPoint(-4[m], -3[m]);
		testee.point_distance(point);

        Assert.assertEqual(testee.point_distance(point)/1[m], 5);
	}

	@Test
	public void testPoint_distance2() {
		vect point = vect.getPoint(7.293[m], 1.667[m]);
		
		vect segStart = vect.getPoint(testeeX[0], testeeY[0]);
		vect segEnd = vect.getPoint(testeeX[1], testeeY[1]);
		m expected_dist = vect.distancePointSegment(point, segStart, segEnd);

        Assert.assertEqual(testee.point_distance(point)/1[m], expected_dist/1[m]);
	}

	@Test
	public void testPoint_distance3() {
		vect point = vect.getPoint(142[m], 142[m]);
		
		vect segStart = vect.getPoint(testeeX[3], testeeY[3]);
		vect segEnd = vect.getPoint(testeeX[4], testeeY[4]);
		m expected_dist = vect.distancePointSegment(point, segStart, segEnd);

        Assert.assertEqual(testee.point_distance(point)/1[m], expected_dist/1[m]);
	}
}