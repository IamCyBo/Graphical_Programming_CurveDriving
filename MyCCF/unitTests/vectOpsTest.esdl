package unitTests;

import resources.vect;
import units.si.m;
import vectorOperations.vectOps;
import assert.Assert;
import SystemLib.Math.MathLib;

singleton class vectOpsTest {

	vectOps testee;
	Assert Assert;
	MathLib lib;

	vect distancePointSegment_point;
	vect distancePointSegment_segA;
	vect distancePointSegment_segB;
	m distancePointSegment_return;

	@Test
	// Test case: get the vector from a point to another
	// Result has a negative and a positive part
	public void testGetVect() {
		vect compare_to = {-1[m], 2[m]};
		vect pointA = {1[m], 2[m]};
		vect pointB = {0[m], 4[m]};
		vect vectAB = testee.getVect(pointA, pointB); 

		Assert.assertEqual(vectAB[0]/1[m], compare_to[0]/1[m]);
		Assert.assertEqual(vectAB[1]/1[m], compare_to[1]/1[m]);
	}
	
	@Test
	// Test case: get the vector from a point to itself
	public void testGetVect2() {	
		vect compare_to = {0[m], 0[m]};
		vect pointA = {-1[m], -1[m]};
		vect pointB = {-1[m], -1[m]};
		vect vectAB = testee.getVect(pointA, pointB); 

		Assert.assertEqual(vectAB[0]/1[m], compare_to[0]/1[m]);
		Assert.assertEqual(vectAB[1]/1[m], compare_to[1]/1[m]);
	}

	@Test
	// Test case: get the length of a vector with two positive parts
	public void testLength() {
		vect v_in = {1[m], 1[m]};
		m length = testee.length(v_in); 
		
		Assert.assertDoubleEqual(length/1[m], lib.sqrt(2));
	}
	
	@Test
	// Test case: get the length of a vector with a negaive part
	public void testLength2() {
		vect v_in = {-6[m], 3[m]};
		m length = testee.length(v_in); 
		
		Assert.assertDoubleEqual(length/1[m], lib.sqrt(45));
	}
		
	@Test
	// Test case: get the length of a vector with length 0
	public void testLength3() {
		vect v_in = {0[m], 0[m]};
		m length = testee.length(v_in); 
		
		Assert.assertEqual(length/1[m], 0);
	}

	@Test
	// Test case: norm the vector with a length > 1
	public void testNorm() {
		vect v_in = {3[m], 4[m]};
		vect v_norm = testee.norm(v_in); 

		Assert.assertDoubleEqual(v_norm[0]/1[m], 3/5);
		Assert.assertDoubleEqual(v_norm[1]/1[m], 4/5);
		Assert.assertNear(testee.length(v_norm)/1[m], 1, 0.0001);
	}
	
	@Test
	// Test case: norm the vector with a length < 1
	public void testNorm2() {
		vect v_in = {-0.5[m], 0.2[m]};
		vect v_norm = testee.norm(v_in); 

		Assert.assertNear(v_norm[0]/1[m], -0.928476, 0.0001);
		Assert.assertNear(v_norm[1]/1[m],  0.371390, 0.0001);
		Assert.assertNear(testee.length(v_norm)/1[m], 1, 0.0001);
	}	
	
	@Test
	// Test case: norm the vector with  length 0
	public void testNorm3() {
		vect v_in = {0[m], 0[m]};
		vect v_norm = testee.norm(v_in); 

		Assert.assertEqual(v_norm[0]/1[m], 0);
		Assert.assertEqual(v_norm[1]/1[m], 0);
	}

	@Test
	// Test case: scalar of two vectors with length >0
	public void testScalar() {
		vect vectA = {1[m], 4[m]};
		vect vectB = {-1[m], 2.5[m]};
		real scalar_return = testee.scalar(vectA, vectB); 

		Assert.assertEqual(scalar_return, 9);
	}
	
	@Test
	// Test case: scalar of two vectors with length >0/=0
	public void testScalar2() {
		vect vectA = {-3.3[m], 6[m]};
		vect vectB = {0[m], 0[m]};
		real scalar_return = testee.scalar(vectA, vectB); 

		Assert.assertEqual(scalar_return, 0);
	}

	@Test
	// Test case: Cross product of two vectors != 0
	public void testCrossProduct() {
		vect vectA = {1[m], 2.3[m]};
		vect vectB = {0.5[m], 9[m]};
		real cross_result = testee.crossProduct(vectA, vectB); 

		Assert.assertDoubleEqual(cross_result, 7.85);
	}	
	
	@Test
	// Test case: Cross product of two vectors where a vaule is negative
	public void testCrossProduct2() {
		vect vectA = {0[m], -2.56[m]};
		vect vectB = {17[m], 5.54[m]};
		real cross_result = testee.crossProduct(vectA, vectB); 

		Assert.assertDoubleEqual(cross_result, 43.52);
	}

	@Test
	// Test case: 90°
	public void testAngle() {
		vect vectA = {1[m], 0[m]};
		vect vectB = {0[m], 2[m]};
		real angle_return = testee.angle(vectA, vectB); 

		Assert.assertNear(angle_return, 1.570796, 0.0001);
	}
	
	@Test
	// Test case: 180°
	public void testAngle2() {
		vect vectA = {2[m], 3[m]};
		vect vectB = {-1[m], -1.5[m]};
		real angle_return = testee.angle(vectA, vectB); 

		Assert.assertNear(angle_return, 3.14159265, 0.0001);
	}
	
	@Test
	// Test case: 0°
	public void testAngle3() {
		vect vectA = {2.3[m], 7[m]};
		vect vectB = {2.3[m], 7[m]};
		real angle_return = testee.angle(vectA, vectB); 

		Assert.assertNear(angle_return, 0, 0.0001);
	}	
	
	@Test
	// Test case: 90°
	public void testAngle4() {
		vect vectA = {0[m], 2[m]};
		vect vectB = {1[m], 0[m]};
		real angle_return = testee.angle(vectA, vectB); 

		Assert.assertNear(angle_return, -1.570796, 0.0001);
	}

	@Test
	public void testDistancePointSegment() {
		distancePointSegment_return = testee.distancePointSegment(distancePointSegment_point, distancePointSegment_segA, distancePointSegment_segB); 

        // TODO: Replace this call with appropriate assertions to implement your test
		Assert.unimplemented();
	}
}