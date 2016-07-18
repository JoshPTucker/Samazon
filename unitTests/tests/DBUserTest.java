package tests;

import static org.junit.Assert.*;

import org.junit.Test;

import model.Spuser;
import Functions.DBUser;
public class DBUserTest {

	
	@Test
	public void test_getvaliduser(){
		String email= "u1@d.com";
		String password="password";
		Spuser  user = DBUser.getValidUser(email, password);
		assertTrue(user!=null);
	}
	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
}
