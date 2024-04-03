package unitTests;

import components.SteeringCtrl;
import assert.Assert;

singleton class SteeringCtrlTest {

	SteeringCtrl testee;
	Assert Assert;

	// Tests if the requirement of 0.01 rad per 10 ms is adhered to for a positive angle difference.
	@Test
	public void testCalc1() {
		testee.^delta = 1;
		testee.str = 0.1;
		testee.calc(); 

		Assert.assertEqual(testee.str, 0.11);
	}
	
	// Tests if the requirement of 0.01 rad per 10 ms is adhered to for a negative angle difference.
	@Test
	public void testCalc2() {
		testee.^delta = -1;
		testee.str = 0.1;
		testee.calc(); 

		Assert.assertEqual(testee.str, 0.09);
	}
	
	// Tests if the steering is adapted correctly if delta is within the range of 0.01 rad per 10ms for a positive angle difference
	@Test
	public void testCalc3() {
		testee.^delta = 0.005;
		testee.str = 0.0;
		testee.calc(); 

		Assert.assertEqual(testee.str, 0.005);
	}
	
	// Tests if the steering is adapted correctly if delta is within the range of 0.01 rad per 10ms for a negative angle difference
	@Test
	public void testCalc4() {
		testee.^delta = -0.005;
		testee.str = 0.0;
		testee.calc(); 

		Assert.assertEqual(testee.str, -0.005);
	}
	
	// Tests if the requirement of a maximum steering angle of 0.5 is met for a negative angle difference
	@Test
	public void testCalc5() {
		testee.^delta = -0.6;
		testee.str = -0.5;
		testee.calc(); 

		Assert.assertEqual(testee.str, -0.5);
	}
	
	// Tests if the requirement of a maximum steering angle of 0.5 is met for a positive angle difference
	@Test
	public void testCalc6() {
		testee.^delta = 0.6;
		testee.str = 0.5;
		testee.calc(); 

		Assert.assertEqual(testee.str, 0.5);
	}
	
	// Tests if a wrong big positive input for steering is handled correctly
	@Test
	public void testCalc7() {
		testee.^delta = 0.3;
		testee.str = 10;
		testee.calc(); 

		Assert.assertEqual(testee.str, 0.5);
	}
	
	// Tests if a wrong big negative input for steering is handled correctly
	@Test
	public void testCalc8() {
		testee.^delta = 0.3;
		testee.str = -10;
		testee.calc(); 

		Assert.assertEqual(testee.str, -0.5);
	}
	
	// Tests if a wrong big input values are handled correctly
	@Test
	public void testCalc9() {
		testee.^delta = 10;
		testee.str = -10;
		testee.calc(); 

		Assert.assertEqual(testee.str, -0.5);
	}
	
	// Tests if steering does not change if delta and steering are equal 
	@Test
	public void testCalc10() {
		testee.^delta = 0.2;
		testee.str = 0.2;
		testee.calc(); 

		Assert.assertEqual(testee.str, 0.2);
	}
	
}