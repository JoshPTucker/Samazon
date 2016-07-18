package tests;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import Functions.DBFunctions;
import model.Sporder;
import model.Spproduct;

public class DBFunctionTests {

	@Test
	public void getOrdersTest() {
		
		List<Sporder> o = DBFunctions.getOrders(1,2);
		
		assertTrue(o.size()==3);
		
	}
	
	@Test
	public void getUserTest() {
		
		Spproduct p = DBFunctions.getProductByID("10");
		
		assertTrue(p.getProductid()==10);
		
	}
}
